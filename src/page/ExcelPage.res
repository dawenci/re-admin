Antd.Space.importStyle
Antd.Card.importStyle
Antd.Table.importStyle
Antd.Pagination.importStyle
Antd.Upload.importStyle
Antd.Button.importStyle

module Styles = {
  let excelPage = Emotion.css({
    "boxSizing": "border-box",
    "display": "flex",
    "flexFlow": "column nowrap",
    "position": "relative",
    "margin": "24px",
  })
}

module UserData = {
  type t = {
    "key": string,
    "name": string,
    "age": int,
    "address": string
  }

  external asUsers: 'a => array<t> = "%identity"
}


@react.component
let make = () => {
  let (data, setData) = React.useState(() => [
    {
      "key": "1",
      "name": "John Brown",
      "age": 32,
      "address": "New York No. 1 Lake Park",
    },
    {
      "key": "2",
      "name": "Jim Green",
      "age": 42,
      "address": "London No. 1 Lake Park",
    },
    {
      "key": "3",
      "name": "Joe Black",
      "age": 32,
      "address": "Sidney No. 1 Lake Park",
    },
    {
      "key": "4",
      "name": "Disabled User",
      "age": 99,
      "address": "Sidney No. 1 Lake Park",
    },
  ])

  let exportToExcel = (_) => {
    let data = Js.Array2.map(data, item => {
      [
        item["key"]->Js.Nullable.return,
        item["name"]->Js.Nullable.return,
        item["age"]->Int.toString->Js.Nullable.return,
        item["address"]->Js.Nullable.return
      ]
    })
    let rows = Js.Array2.concat([["key"->Js.Nullable.return, "name"->Js.Nullable.return, "age"->Js.Nullable.return, "address"->Js.Nullable.return]], data)
    let wb = Excel.makeWorkbook(rows)
    Excel.downloadExcel(wb, "users.xlsx")
  }

  let handleFileImport = (file, _) => {
    Excel.readExcelFile(file, workbook => {
      let firstSheetName = Js.Array2.unsafe_get(workbook.\"SheetNames", 0)
      let sheet = Js.Dict.get(workbook.\"Sheets", firstSheetName)->Option.getExn
      let data = Xlsx.Utils.sheetToJson(sheet)
      setData(_ => data->UserData.asUsers)
    })

    false
  }

  let columns = [
    Antd.Table.Column.makeProps(~title="Name", ~dataIndex="name", ()),
    Antd.Table.Column.makeProps(~title="Age", ~dataIndex="age", ()),
    Antd.Table.Column.makeProps(~title="Address", ~dataIndex="address", ()),
  ]

  <div className={Styles.excelPage}>
    <Antd.Card style={ReactDOM.Style.make(~marginBottom="16px", ())}>
      <Antd.Space size={#middle}>
        <Antd.Button _type={#primary} onClick={exportToExcel} icon={<AntdIcon.DownloadOutlined />}>
        {`导出 Excel`->React.string}
        </Antd.Button>

        <Antd.Upload beforeUpload={handleFileImport} showUploadList={false} accept=".xls,.xlsx" maxCount={1}>
          <Antd.Button _type={#primary} icon={<AntdIcon.UploadOutlined />}>
          {`导入 Excel`->React.string}
          </Antd.Button>
        </Antd.Upload>

        {`导入格式参考导出的 Excel 文件` -> React.string}
      </Antd.Space>
    </Antd.Card>

    <Antd.Card>
      <Antd.Table
        columns={columns}
        dataSource={data}
      />    
    </Antd.Card>
 </div>
}
