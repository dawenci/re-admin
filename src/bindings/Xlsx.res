module String = {
  type t
}

module AppVersion = {
  type t
}

module CalcPr = {
  type t
}

module SheetObject = {
  type t
}

module WorkbookObject = {
  type t = {
    \"AppVersion": AppVersion.t,
    \"CalcPr": CalcPr.t,
    // \"Names": ,
    \"Sheets": SheetObject.t,
    // \"Views": ,
    // \"WBProps": ,
    // \"WBView": array<>,
    xmlns: string,
  }
}

module Workbook = {
  type t = {
    \"Custprops": Js.Dict.t<string>,
    // Deps: 
    // Directory: 
    // charts: array<>,
    // comments: array<>,
    // coreprops: array<string>,
    // custprops: array<string>,
    // defaults: ,
    drawings: array<string>,
    extprops: array<string>,
    links: array<string>,
    macros: array<string>,
    rels: array<string>,
    sheets: array<string>,
    sst: array<string>,
    strs: array<string>,
    style: string,
    styles: array<string>,
    themes: array<string>,
    vba: array<string>,
    workbooks: array<string>,
    // \"Props": ,
    // \"SSF": ,
    \"SheetNames": array<string>,
    \"Sheets": Js.Dict.t<SheetObject.t>,
    \"Strings": array<String.t>,
    // \"Styles": ,
    // \"Themes": ,
    \"Workbook": WorkbookObject.t
  }
}

@module("xlsx")
external read: (Webapi.File.t, 'options) => Workbook.t = "read"

@module("xlsx")
external write: ('data, 'options) => 'out = "write"

module Utils = {
  @module("xlsx") @scope("utils")
  external sheetToJson: SheetObject.t => Js.t<{..}>  = "sheet_to_json"

  @module("xlsx") @scope("utils")
  external encodeCell: {"r": int, "c": int} => 'ref = "encode_cell"

  @module("xlsx") @scope("utils")
  external encodeRange: {
    "s": { "r": int, "c": int },
    "e": { "r": int, "c": int }
  } => 'ref = "encode_range"
}

module SSF = {
  type t

  @module("xlsx") @scope("SSF")
  external _table: t = "_table"

  @get_index
  external _tableGet: (t, int) => 'a = ""

  let tableGet = index => _tableGet(_table, index)
}
