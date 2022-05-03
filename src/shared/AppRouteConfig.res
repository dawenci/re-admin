type rec routeCfg = {
  "path": string,
  "name": option<string>,
  "redirect": option<string>,
  "meta": option<ReRouter_Meta.t>,
  "exact": option<bool>,
  "strict": option<bool>,
  "sensitive": option<bool>,
  "matched": option<ReRouter_Match.t>,
  "component": option<unit => React.element>,
  "hidden": option<bool>,
  "icon": option<unit => React.element>,
  "title": option<unit => React.element>,
  "children": option<array<routeCfg>>,
}

@obj external make: (
  ~path: string,
  ~name: string=?,
  ~redirect: string=?,
  ~meta: ReRouter_Meta.t=?,
  ~exact: bool=?,
  ~strict: bool=?,
  ~sensitive: bool=?,
  ~matched: ReRouter_Match.t=?,
  ~component: unit => React.element=?,
  ~hidden: bool=?,
  ~icon: unit => React.element=?,
  ~title: unit => React.element=?,
  ~children: array<routeCfg>=?,
  unit
) => routeCfg = ""

let rec toRoute = (routes: array<routeCfg>) => {
  routes
  ->Js.Array2.map(config => {
    switch config["children"] {
    | Some(children) =>
      <ReRouter.Route
        path=config["path"]
        exact=?config["exact"]
        component=?config["component"]
        redirect=?config["redirect"]
        meta=?config["meta"]
        strict=?config["strict"]
        sensitive=?config["sensitive"]
        matched=?config["matched"]
      >
      {toRoute(children)}
      </ReRouter.Route>
    | None =>
      <ReRouter.Route
        path=config["path"]
        exact=?config["exact"]
        component=?config["component"]
        redirect=?config["redirect"]
        meta=?config["meta"]
        strict=?config["strict"]
        sensitive=?config["sensitive"]
        matched=?config["matched"]
      />
    }
  })
  ->React.array
}

let rec toMenu = (routes: array<routeCfg>) => {
  routes
  ->Js.Array2.filter(config => {
    switch config["hidden"] {
    | Some(value) => !value
    | None => true
    }
  })
  ->Js.Array2.map(config => {
    switch config["children"] {
    | Some(children) =>
      <Antd.Menu.SubMenu
        key=config["path"]
        icon=?{switch config["icon"] {
        | Some(icon) => Some(icon())
        | None => None
        }}
        title=?{switch config["title"] {
        | Some(title) => Some(title())
        | None => None
        }}>
        {toMenu(children)}
      </Antd.Menu.SubMenu>
    | None =>
      <Antd.Menu.Item
        key=config["path"]
        icon=?{switch config["icon"] {
        | Some(icon) => Some(icon())
        | None => None
        }}>
        <ReRouter.Link action={#Jump("/#" ++ config["path"])}>
        {switch config["title"] {
        | Some(title)=>title()
        | None => React.null
        }}
        </ReRouter.Link>
      </Antd.Menu.Item>
    }
  })
  ->React.array
}
