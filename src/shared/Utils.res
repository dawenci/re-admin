let isMouseRightClick = event =>
  !ReactEvent.Mouse.defaultPrevented(event) &&
  ReactEvent.Mouse.button(event) == 0 &&
  !ReactEvent.Mouse.altKey(event) &&
  !ReactEvent.Mouse.ctrlKey(event) &&
  !ReactEvent.Mouse.metaKey(event) &&
  !ReactEvent.Mouse.shiftKey(event)

module Json = {
  let decodeArrayString = (json: option<Js.Json.t>): option<array<string>> =>
    json
    ->Option.flatMap(Js.Json.decodeArray)
    ->Option.map(xs => xs->Array.keepMap(Js.Json.decodeString))
}

let tap: ('a, 'a => 'b)=> 'a = (v, f) => {
  f(v)
  v
}
