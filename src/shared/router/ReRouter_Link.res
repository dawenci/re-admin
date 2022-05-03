type onClickAction = [
  | #Jump(string)
  | #External(string)
  | #Fn(unit => unit)
]

let jump = l => #Jump(l)
let fn = f => #Fn(f)
let external_ = l => #External(l)

let availableIf: (bool, onClickAction) => onClickAction = (available, target) =>
  available ? target : #Fn(ignore)

@react.component
let make = (
  ~className="",
  ~action: option<[#Jump(string) | #External(string) | #Fn(unit => unit)]>=?,
  ~style=ReactDOM.Style.make(),
  ~children: React.element,
) => {
  let href = switch action {
  | Some(#Jump(location)) => Some(location)
  | Some(#External(location)) => Some(location)
  | Some(#Fn(_)) => None
  | None => None
  }

  let handleClick = event => {
    switch action {
    | Some(#Jump(location)) =>
      if Utils.isMouseRightClick(event) {
        event->ReactEvent.Mouse.preventDefault
        location->ReRouter_Navigator.push
      }
    | Some(#External(_)) => ()
    | Some(#Fn(fn)) => fn()
    | None => ()
    }
    ignore()
  }

  <a className ?href style onClick={handleClick}> children </a>
}

module Button = {
  @react.component
  let make = (
    ~className="",
    ~style=ReactDOM.Style.make(),
    ~action: option<[#Jump(string) | #External(string) | #Fn(unit => unit)]>=?,
    ~disabled=false,
    ~children,
  ) => {
    let handleClick = event => {
      if !disabled {
        switch action {
        | Some(#Jump(location)) =>
          if Utils.isMouseRightClick(event) {
            event->ReactEvent.Mouse.preventDefault
            location->ReRouter_Navigator.push
          }
        | Some(#External(_)) => ()
        | Some(#Fn(fn)) => fn()
        | None => ()
        }
      }
      ignore()
    }
    <button className style onClick={handleClick} disabled> children </button>
  }
}
