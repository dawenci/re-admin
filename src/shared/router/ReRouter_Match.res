// 匹配到的 Route 实例

type t = {
  path: string,
  urlMatchedPortion: string,
  params: ReRouter_Param.t,
  query: ReRouter_Query.t,
  hash: string,
  isExact: bool,
  name: option<string>,
  meta: option<ReRouter_Meta.t>,
}

@obj
external make: (
  ~path: string,
  ~urlMatchedPortion: string,
  ~params: ReRouter_Param.t,
  ~query: ReRouter_Query.t,
  ~hash: string,
  ~isExact: bool,
  ~name: string=?,
  ~meta: ReRouter_Meta.t=?,
  unit,
) => t = ""

let root = (~root: option<string>=?, ()) => {
  make(
    ~path=Option.getWithDefault(root, "/"),
    ~urlMatchedPortion="/",
    ~params=ReRouter_Param.empty(),
    ~query=ReRouter_Query.empty(),
    ~hash="",
    ~isExact=true,
    ~name="",
    ~meta=ReRouter_Meta.empty(),
    ()
  )
}

let matchRoute = (
  ~pathname: string,
  ~path: string,
  ~strict: option<bool>=?,
  ~sensitive: option<bool>=?,
  ~exact: option<bool>=?,
  ~name: option<string>=?,
  ~meta: option<ReRouter_Meta.t>=?,
  (),
) => {
  let options = PathToRegexp.ToRegexpOptions.make(
    ~sensitive=Option.getWithDefault(sensitive, false),
    ~strict=Option.getWithDefault(strict, false),
    ~end=Option.getWithDefault(exact, false),
    (),
  )
  let (regexp, keys) = ReRouter_Path.compileRoutePath(~path, ~options, ())
  let (success, url, params) = ReRouter_Path.matchAndCreateParams(~regexp, ~keys, ~path=pathname)
  let isExact = pathname == url

  if (Option.getWithDefault(exact, false) && !isExact) {
    None
  }
  else if success {
    let query = ReRouter_Query.fromString(ReRouter_Path.parse(pathname).query)
    let hashIndex = pathname->Js.String2.indexOf("#")
    let hash = if hashIndex != -1 {
      pathname->Js.String2.sliceToEnd(~from=hashIndex)
    } else {
      ""
    }
    Some(make(~path, ~urlMatchedPortion=url, ~name?, ~params, ~query, ~hash, ~meta?, ~isExact, ()))
  }
  else {
    None
  }
}
