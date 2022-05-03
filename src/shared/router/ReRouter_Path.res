type parsed = {path: string, query: string, hash: string}

let parse: string => parsed = path => {
  let hashIndex = path->Js.String2.indexOf("#")
  let (path, hash) = if hashIndex != -1 {
    (path->Js.String2.slice(~from=0, ~to_=hashIndex), path->Js.String2.sliceToEnd(~from=hashIndex))
  } else {
    (path, "")
  }

  let queryIndex = path->Js.String2.indexOf("?")
  let (path, query) = if queryIndex != -1 {
    (
      path->Js.String2.slice(~from=0, ~to_=queryIndex),
      path->Js.String2.sliceToEnd(~from=queryIndex),
    )
  } else {
    (path, "")
  }

  {
    path: path,
    hash: hash,
    query: query,
  }
}

// "/a/./b/../../c/" -> "/c"
let simplifyPath: string => string = path => {
  let stack =
    path
    ->Js.String2.splitByRe(%re("/\/+/"))
    ->Js.Array2.map(p => {
      switch p {
      | Some(p) => p
      | None => ""
      }
    })
    ->Js.Array2.filter(p => p != "" && p != ".")

  let rec loop = (result, parent) => {
    let p = stack->Js.Array2.pop
    switch p {
    | Some(p) =>
      if p == ".." {
        loop(result, parent + 1)
      } else if parent != 0 {
        loop(result, parent - 1)
      } else if p != "" {
        let result = result == "" ? p : p ++ "/" ++ result
        loop(result, parent)
      } else {
        result
      }
    | None => result
    }
  }

  "/" ++ loop("", 0)
}

let resolve: (~base: string, ~relative: string) => string = (~base, ~relative) => {
  let ch0 = relative->Js.String2.charAt(0)
  if ch0 == "/" {
    relative
  } else if ch0 == "?" || ch0 == "#" {
    base ++ relative
  } else {
    let res = (base ++ "/" ++ relative)->simplifyPath
    res->Js.String2.charAt(0) == "/" ? res : "/" ++ res
  }
}

/* * 路由路径编译成正则 */
let compileRoutePath: (
  ~path: string,
  ~options: PathToRegexp.ToRegexpOptions.t=?,
  unit,
) => (Js.Re.t, array<PathToRegexp.Key.t>) = (~path, ~options=?, ()) => {
  let keys = []
  let regexp = PathToRegexp.Re.stringPathToRegexp(~path, ~keys, ~options?, ())
  (regexp, keys)
}

/* * 匹配路由并生成 params 对象 */
let matchAndCreateParams: (
  ~regexp: Js.Re.t,
  ~keys: array<PathToRegexp.Key.t>,
  ~path: string,
) => (bool, string, ReRouter_Param.t) = (~regexp, ~keys, ~path) => {
  let params = ReRouter_Param.empty()
  let match = regexp->Js.Re.exec_(path)

  switch match {
  | Some(match) =>
    let captures = match->Js.Re.captures
    // url 中匹配到的部分
    let url = captures->Js.Array2.unsafe_get(0)->Js.Nullable.toOption->Option.getWithDefault("")
    // 各个 param 值
    let values = captures->Js.Array2.sliceFrom(1)
    let _ = keys->Js.Array2.forEachi((key, index) => {
      let key = PathToRegexp.Key.getName(key)
      let val =
        values->Js.Array2.unsafe_get(index)->Js.Nullable.toOption->Option.getWithDefault("")
      params->Js.Dict.set(key, val)
    })
    (true, url, params)
  | None =>
    (false, "", params)
  }
}
