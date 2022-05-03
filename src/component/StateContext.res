module Store = {
  type t<'state, 'action> = {
    mutable state: 'state,
    mutable reducer: ('state, 'action) => 'state,
  }

  let make: (~state: 'a, ~reducer: ('a, 'b) => 'a) => t<'a, 'b> = (~state, ~reducer) => {
    state: state,
    reducer: reducer,
  }

  let internalDispatch: (t<'state, 'action>, 'action) => unit = (store, action) => {
    store.state = store.reducer(store.state, action)
  }

  let getState: t<'state, 'action> => 'state = store => store.state

  let setReduce: (t<'state, 'action>, ('state, 'action) => 'state) => unit = (store, reducer) => {
    store.reducer = reducer
  }
}

module type StoreShape = {
  type state
  type action
  let store: Store.t<state, action>
}

module Make = (StateStore: StoreShape) => {
  let context = React.createContext(StateStore.store)

  let dispatchRef = ref(None)

  let useStore = () => {
    React.useContext(context)
  }

  let useState = () => {
    useStore().state
  }

  let useDispatch: (unit, StateStore.action) => unit = () => {
    let store = useStore()
    switch dispatchRef.contents {
    | Some(dispatch) =>
      action => {
        dispatch(action)
        Store.internalDispatch(store, action)
      }
    | None => Store.internalDispatch(store)
    }
  }

  module ContextProvider = {
    let make = React.Context.provider(context)
  }

  module Provider = {
    @react.component
    let make = (~children) => {
      // Js.log("StateContext render")
      let store = useStore()
      let (state, dispatch) = React.useReducer(store.reducer, store.state)
      dispatchRef.contents = Some(dispatch)

      let props = React.Context.makeProps(
        ~value=Store.make(~reducer=store.reducer, ~state),
        ~children,
        (),
      )

      React.createElement(ContextProvider.make, props)
    }
  }

  module Consumer = {
    @react.component
    let make = (~children: (StateStore.state, StateStore.action => unit) => React.element) => {
      let state = useState()
      let dispatch = useDispatch()
      children(state, dispatch)
    }
  }
}
