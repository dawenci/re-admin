type onClickAction =
  | Jump(Location.t)
  | Fn(unit => unit)

let jump = l => Jump(l)
let fn = f => Fn(f)

let availableIf: (bool, onClickAction) => onClickAction = (available, target) =>
  available ? target : Fn(ignore)

let handleClick = (onClickAction, event) => {
  switch onClickAction {
  | Jump(location) =>
    if Utils.isMouseRightClick(event) {
      event->ReactEvent.Mouse.preventDefault
      location->Location.toString->ReRouter.push
    }
  | Fn(fn) => fn()
  }
  ignore()
}

@react.component
let make = (~className="", ~style=ReactDOM.Style.make(), ~onClick, ~children) => {
  let href = switch onClick {
  | Jump(location) => Some(location->Location.toString)
  | Fn(_fn) => None
  }
  <a className ?href style onClick={handleClick(onClick)}> children </a>
}

module Button = {
  @react.component
  let make = (~className="", ~style=ReactDOM.Style.make(), ~onClick, ~disabled=false, ~children) =>
    <button className style onClick={handleClick(onClick)} disabled> children </button>
}
