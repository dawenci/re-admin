Antd.Spin.importStyle

let spin = () => <div
    style={ReactDOM.Style.make(
    ~position="absolute",
    ~top="0",
    ~right="0",
    ~bottom="0",
    ~left="0",
    ~width="32px",
    ~height="32px",
    ~margin="auto",
    (),
  )}>
  <Antd.Spin />
</div>

// 仅限匿名（即未登录的）用户访问
module AnonymousOnly = {
  @react.component
  let make = (~fallback: option<unit => React.element>=?, ~children) => {
    let state = GlobalState.Context.useState()
    switch state.user {
    | AsyncData.Reloading(_) | AsyncData.Complete(_) =>
      switch fallback {
      | Some(fb) => fb()
      | None => React.null
      }
    | _ => children
    }
  }
}

// 仅限登录的用户访问
module AuthenticatedOnly = {
  @react.component
  let make = (
    // 加载用户信息过程的渲染逻辑
    ~loadingRender: option<unit => React.element>=?,
    // 无用户信息时的渲染逻辑
    ~forbiddenRender: option<unit => React.element>=?,
    ~children: React.element,
  ) => {
    let state = GlobalState.Context.useState()
    let dispatch = GlobalState.Context.useDispatch()

    React.useEffect1(() => {
      // Js.log("AccessControl.AuthenticatedOnly did mouted")
      switch state.user {
      | AsyncData.Init => GlobalState.Actions.loadUser(state, dispatch)
      | _ => ()
      }
      None
    }, [state.user])

    switch state.user {
    | AsyncData.Init =>
      // Js.log(`无登录用户信息。`)
      // Js.log("AccessControl.AuthenticatedOnly, user.Init")
      switch forbiddenRender {
      | Some(render) => render()
      | None => React.null
      }
    | AsyncData.Loading =>
      // Js.log(`用户登录中...`)
      // Js.log("AccessControl.AuthenticatedOnly, user.Loading")
      switch loadingRender {
      | Some(render) => render()
        // 加载过程，默认显示 Spin
      | None => spin()
      }
    | _ =>
      // Js.log(`用户已登录，放行...`)
      children
    }
  }
}

// 仅限符合角色限制的用户访问
module ByRole = {
  @react.component
  let make = (
    // 必须拥有指定角色
    ~role: option<string>=?,
    // 必须拥有指定的所有角色即可放行
    ~allRoles: option<array<string>>=?,
    // 必须拥有指定的任一角色即可放行
    ~anyRoles: option<array<string>>=?,
    // 加载用户信息过程的渲染逻辑
    ~loadingRender: option<unit => React.element>=?,
    ~forbiddenRender: option<unit => React.element>=?,
    ~children: React.element,
  ) => {
    let state = GlobalState.Context.useState()
    let dispatch = GlobalState.Context.useDispatch()

    React.useEffect1(() => {
      // Js.log("AccessControl.AuthenticatedOnly did mouted")
      switch state.user {
      | AsyncData.Init => GlobalState.Actions.loadUser(state, dispatch)
      | _ => ()
      }
      None
    }, [state.user])

    switch state.user {
    | AsyncData.Init =>
      // Js.log(`无登录用户信息。`)
      // Js.log("AccessControl.AuthenticatedOnly, user.Init")
      switch forbiddenRender {
      | Some(render) => render()
      | None => React.null
      }
    | AsyncData.Loading =>
      // Js.log(`用户登录中...`)
      // Js.log("AccessControl.AuthenticatedOnly, user.Loading")
      switch loadingRender {
      | Some(render) => render()
      | None =>
        // 加载过程，默认显示 Spin
        spin()
      }
    | AsyncData.Reloading(user) | AsyncData.Complete(user) =>
      // Js.log(`用户已登录，检查权限...`)
      let ok = ref(true)

      switch allRoles {
      // 如果设置了 allRoles，则要求用户拥有数组中列出的所有角色
      | Some(roles) =>
        ok := roles->Js.Array2.every(role => user.roles->Js.Array2.includes(role))
      | None => ()
      }
      // 上个检测放行时
      if (ok.contents) {
        // 如果设置了 role，则要求用户拥有该 role
        switch role {
        | Some(role) =>
          ok := user.roles->Js.Array2.includes(role)
        | None => ()
        }
      }
      // 上个检测放行时
      if (ok.contents) {
        // 如果设置了 anyRoles，则要求用户至少拥有数组中的任一角色
        switch anyRoles {
        | Some(roles) =>
          ok := roles->Js.Array2.some(role => user.roles->Js.Array2.includes(role))
        | None => ()
        }
      }

      // 满足所有条件，渲染子组件
      if ok.contents {
        // Js.log(`角色权限检测通过，放行用户。`)
        children
      }
      // 权限不足
      else {
        // Js.log(`权限不足。`)
        switch forbiddenRender {
        | Some(render) => render()
        | None => <Error403 />
        }
      }
    }
  }
}
