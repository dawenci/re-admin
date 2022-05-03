module Key = {
  type t

  @obj
  external makeStr: (
    ~name: string,
    ~prefix: string,
    ~suffix: string,
    ~pattern: string,
    ~modifier: string,
    unit,
  ) => t = ""

  @obj
  external makeNumber: (
    ~name: float,
    ~prefix: string,
    ~suffix: string,
    ~pattern: string,
    ~modifier: string,
    unit,
  ) => t = ""

  @get external getName_: t => string = "name"

  let getName: t => string = t => {
    let name = getName_(t)
    %raw("name = String(name)")->ignore
    name
  }
}

module Token = {
  type t

  external stringToToken: string => t = "%identity"
  external keyToToken: Key.t => t = "%identity"
}

module ToRegexpOptions = {
  type t

  @obj
  external make: (
    ~sensitive: bool=?,
    ~strict: bool=?,
    ~end: bool=?,
    ~start: bool=?,
    ~delimiter: string=?,
    ~endsWith: array<string>=?,
    ~encode: string => string=?,
    ~prefixes: array<string>=?,
    unit,
  ) => t = ""
}

// parse 函数的选项
module ParseOptions = {
  type t

  @obj external make: (~delimiter: string=?, ~prefixes: string=?, unit) => t = ""
}

// comiple 函数的选项
module CompileOptions = {
  type t

  @obj
  external make: (
    ~delimiter: string=?,
    ~prefixes: string=?,
    ~sensitive: bool=?,
    ~encode: (string, Key.t) => string=?,
    ~validate: bool=?,
    unit,
  ) => t = ""
}

// 将 path 编译成正则
module Re = {
  @module("path-to-regexp")
  external stringPathToRegexp: (
    ~path: string,
    ~keys: array<Key.t>=?,
    ~options: ToRegexpOptions.t=?,
    unit,
  ) => Js.Re.t = "pathToRegexp"

  @module("path-to-regexp")
  external regExpPathToRegexp: (
    ~path: Js.Re.t,
    ~keys: array<Key.t>=?,
    ~options: ToRegexpOptions.t=?,
    unit,
  ) => Js.Re.t = "pathToRegexp"

  @module("path-to-regexp")
  external regexpArrayToRegexp: (
    ~path: array<Js.Re.t>,
    ~keys: array<Key.t>=?,
    ~options: ToRegexpOptions.t=?,
    unit,
  ) => Js.Re.t = "pathToRegexp"

  @module("path-to-regexp")
  external stringArrayToRegexp: (
    ~path: array<string>,
    ~keys: array<Key.t>=?,
    ~options: ToRegexpOptions.t=?,
    unit,
  ) => Js.Re.t = "pathToRegexp"

  @module("path-to-regexp")
  external match: (~path: string, ~options: 'a=?, unit) => Js.Re.t = "match"
}

// path 解析
module Parser = {
  @module("path-to-regexp")
  external parse: (~str: string=?, ~options: ParseOptions.t=?, unit) => array<Token.t> = "parse"
}

// 将 path 编译成一个函数，该函数接受 params 对象填充 path 对应位置生成完整的 path
module Filler = {
  type t<'a> = Js.t<'a> => string

  @module("path-to-regexp")
  external compile: (~str: string, ~options: CompileOptions.t=?, unit) => t<'a> = "compile"
}
