// open Promise

type lifecycle =
| DidMount(unit => unit)
| WillUnmount(unit => unit)
| DidUpdate(unit => unit)

let useLifecycle = (lifecycle: lifecycle) => {
  switch lifecycle {
  | DidMount(cb) =>
    React.useEffect0(() => {
      cb()
      None
    })
  | WillUnmount(cb) =>
    React.useEffect0(() => Some(cb))
  | DidUpdate(cb) => 
    let flag = React.useRef(false)
    React.useEffect(() => {
      if (flag.current) {
        cb()
      }
      else {
        flag.current = true
      }
      None
    })
  }
}

// Hook 销毁时标记取消，以阻止不必要的逻辑执行
let guardByDidCancel: (React.ref<bool>, unit => unit) => unit = (didCancel, cb) => {
  if !didCancel.current {
    // Js.log("guard.cb()")
    cb()
  } else {
    // Js.log("did cancel")
    ()
  }
}

let useGuard: unit => ((unit => unit) => unit, unit => unit) = () => {
  let didCancel = React.useRef(false)
  let cancel = () => {
    Js.log("cancel")
    didCancel.current = true
  }
  let guard = guardByDidCancel(didCancel)

  React.useEffect0(() => Some(cancel))

  (guard, cancel)
}
