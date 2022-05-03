type props = {
  "path": string,
  "name": option<string>,
  "redirect": option<string>,
  "meta": option<ReRouter_Meta.t>,
  "exact": option<bool>,
  "strict": option<bool>,
  "sensitive": option<bool>,
  "matched": option<ReRouter_Match.t>,
  "component": option<unit => React.element>,
  "children": option<React.element>,
}

@obj
external makeProps: (
  ~path: string,
  ~name: string=?,
  ~redirect: string=?,
  ~meta: ReRouter_Meta.t=?,
  ~exact: bool=?,
  ~strict: bool=?,
  ~sensitive: bool=?,
  ~matched: ReRouter_Match.t=?,
  ~component: unit => React.element=?,
  ~children: React.element=?,
  unit,
) => props = ""

let make: React.componentLike<props, React.element> = props => {
  // Js.log(props)

  let contextValue = ReRouter_Context.useRouter()

  let maybeMatch = switch props["matched"] {
  // 外层是 ReRouter.Switch 的情况，能进来已经是匹配命中了
  | Some(_) as a => a
  | None =>
    // 外层不是 switch 的情况，需要人工检测匹配情况
    let maybeMatch = ReRouter_Match.matchRoute(
      ~pathname=contextValue.url,
      ~path=props["path"],
      ~exact=?props["exact"],
      ~strict=?props["strict"],
      ~sensitive=?props["sensitive"],
      ~name=?props["name"],
      ~meta=?props["meta"],
      (),
    )
    switch maybeMatch {
    | Some(_match) as a =>
      // Js.log3(`匹配路由成功：`, _match, contextValue.url)
      a
    | None =>
      // Js.log3(`跳过不匹配的路由：`, props["path"], contextValue.url)
      None
    }
  }

  switch maybeMatch {
  | Some(match) =>
    let newContextValue: ReRouter_Context.t = {
      ...contextValue,
      match: match,
    }
    <ReRouter_Context.Provider value={Some(newContextValue)}>
      {switch props["component"] {
      | Some(component) => component()
      | None =>
        switch props["children"] {
        | Some(children) => children
        | _ => React.null
        }
      }}
    </ReRouter_Context.Provider>
  | None => React.null
  }
}
