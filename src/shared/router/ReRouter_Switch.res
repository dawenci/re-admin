@get external getProps: React.element => ReRouter_Route.props = "props"

@react.component
let make = (~children) => {
  let url = ReRouter_Context.useUrl()

  let matchChild = ref(None)
  let childProps = ref(None)
  let route = ref(None)

  // Js.log(`进行路由选择...`)
  React.Children.forEach(children, child => {
    switch matchChild.contents {
    | Some(_) => ()
    | None =>
      // Js.log2(`检测 Route 项:`, child)
      let props = getProps(child)
      let routeMatch = ReRouter_Match.matchRoute(
        ~pathname=url,
        ~path=props["path"],
        ~exact=?props["exact"],
        ~strict=?props["strict"],
        ~sensitive=?props["sensitive"],
        ~name=?props["name"],
        ~meta=?props["meta"],
        (),
      )
      switch routeMatch {
      | Some(match) =>
        // Js.log3(`匹配路由成功：`, routeMatch, url)

        matchChild.contents = Some(child)
        route.contents = Some(match)
        childProps.contents = Some(props)
        // Js.log2("PROPS::::::", props)
      | None =>
        // Js.log3(`跳过不匹配的路由：`, props["path"], url)
        ()
      }
    }
  })

  switch (matchChild.contents, route.contents) {
  | (Some(matchChild), Some(_)) =>
    // Js.log(`开始渲染路由对应的组件...`)
    // Js.log(route)
    React.cloneElement(matchChild, childProps.contents->Option.getExn)
  | _ => React.null
  }
}
