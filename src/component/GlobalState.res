open Promise

module Store = {
  type side = { collapsed: bool }

  type state = {
    user: AsyncData.t<User.t>,
    side: side
  }
  type action =
    | SetUser(AsyncData.t<User.t>)
    | DeleteUser
    | FoldSide
    | UnfoldSide

  let collapsed = switch Dom.Storage2.localStorage->Dom.Storage2.getItem("GlobalState.side.collapsed") {
  | Some(_) => true
  | None => false
  }

  let initialState: state = {
    user: AsyncData.Init,
    side: {
      collapsed: collapsed
    }
  }

  let reducer = (state, action) => {
    switch action {
    | DeleteUser => { ...state, user: AsyncData.Init }
    | SetUser(data) => { ...state, user: data }
    | FoldSide => { ...state, side: { collapsed: true } }
    | UnfoldSide => { ...state, side: { collapsed: false } }
    }
  }

  let store = StateContext.Store.make(~state=initialState, ~reducer)
}

module Actions = {
  let loadUser: (Store.state, Store.action => unit) => unit = (state, dispatch) => {
    if state.user->AsyncData.isBusy {
      ()
    } else {
      // Js.log("loadUser")
      dispatch(SetUser(state.user->AsyncData.toBusy))

      UserApi.currentUser()
      ->then(result =>
        switch result {
        | Ok(user) =>
          dispatch(SetUser(user->AsyncData.complete))
        | Error(appError) =>
          AppError.print(appError)
          Js.Console.error("load current user error, redirect to login.")
          dispatch(SetUser(AsyncData.Init))
          "/#/login"->ReRouter.push
        }->resolve
      )
      ->ignore
    }
  }
}

module Context = StateContext.Make(Store)
