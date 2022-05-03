let readExcelFile = (file: Webapi.File.t, callback: Xlsx.Workbook.t => unit) => {
  let reader = FileReader.make()

  FileReader.setOnload(reader, e => {
    let data = e["target"]["result"]
    let workbook = Xlsx.read(data, { "type": "array" })
    callback(workbook)
  })

  FileReader.readAsArrayBuffer(reader, file)
}

module Serial = {
  // 每天的毫秒数
  let milliseconds_per_day = 86400000.
  // 自 1899-31-12 00:00:00 起算的毫秒偏移（相对于 1970-01-01 00:00:00）
  // 代表 Excel 中的 0
  let offset_since_18991231 = Js.Date.utcWithYMDHMS(
    ~year=1899.,
    ~month=11.,
    ~date=31.,
    ~hours=0.,
    ~minutes=0.,
    ~seconds=0.,
    ()
  )

  // Excel 的日期内部存储为自然数，代表从 1900年 1 月 0 日 开始计算的第几天
  let fromDate = (date: Js.Date.t) => {
    let time = Js.Date.getTime(date)
    let serial = (time -. offset_since_18991231) /. milliseconds_per_day
    serial->Float.toInt
  }
}

external asDate: 'a => Js.Date.t = "%identity"

let rangeToSheet = (rows: array<'any>, _opts: 'options) => {
  let worksheet = Js.Dict.empty()
  let range = {
    "s": {
      "c": 0,
      "r": 0,
    },
    "e": {
      "c": Js.Array2.reduce(rows, (acc, row) => Js.Math.max_int(acc, Js.Array2.length(row)), 0),
      "r": Js.Array2.length(rows),
    },
  }

  Js.Array2.forEachi(rows, (row, rowIndex) => {
    Js.Array2.forEachi(row, (col, colIndex) => {
      if !Js.Nullable.isNullable(col) {
        let col = col->Js.Nullable.toOption->Option.getExn
        let cellRef = Xlsx.Utils.encodeCell({ "r": rowIndex, "c": colIndex })
        let cell = Js.Dict.empty()
        if Js.typeof(col) == "number" {
          Js.Dict.set(cell, "t", "n")
          Js.Dict.set(cell, "v", col)
        } else if Js.typeof(col) == "boolean" {
          Js.Dict.set(cell, "t", "b")
          Js.Dict.set(cell, "v", col)
        } else if %raw(`col instanceof Date`) {
          Js.Dict.set(cell, "t", "n")
          Js.Dict.set(cell, "z", Xlsx.SSF.tableGet(14))
          Js.Dict.set(cell, "v", Serial.fromDate(asDate(col))->Js.Int.toString)
        } else {
          Js.Dict.set(cell, "t", "s")
          Js.Dict.set(cell, "v", col)
        }
        Js.Dict.set(worksheet, cellRef, cell)
      }
    })
  })

  Js.Dict.set(worksheet, "!ref", Xlsx.Utils.encodeRange(range))
  worksheet
}

let makeWorkbook = rows => {
  Xlsx.write({
    "SheetNames": ["Sheet1"],
    "Sheets": { "Sheet1": rangeToSheet(rows, Js.Obj.empty())},
  }, {
    "bookType": "xlsx",
    "bookSST": false,
    "type": "binary"
  })
}

let string2ArrayBuffer = str => {
  let len = Js.String2.length(str)
  let buffer = Js.TypedArray2.ArrayBuffer.make(len)
  let view = Js.TypedArray2.Uint8Array.fromBuffer(buffer)
  for i in 0 to len - 1 {
    let code = Js.String2.charCodeAt(str, i)->Belt.Float.toInt
    let val = land(code, 0xFF)
    Js.TypedArray2.Uint8Array.unsafe_set(view, i, val)
  }
  buffer
}

module Blob = {
  @new external make: (array<Js.TypedArray2.ArrayBuffer.t>, 'options) => Webapi.Blob.t = "Blob"
}

let downloadExcel = (wbout, filename: string) => {
  let buffer = string2ArrayBuffer(wbout)
  let blob = Blob.make([buffer], {
    "type": "application/octet-stream"
  })
  FileSaver.saveAs(
    #Blob(blob),
    ~filename=filename,
    ()
  )
}
