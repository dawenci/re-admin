type t = Js.Dict.t<string>

let make = Js.Dict.fromArray

let empty = Js.Dict.empty

let fillPath = (path: string, params: Js.t<'a>) => {
  try {
    let filler = PathToRegexp.Filler.compile(~str=path, ())
    filler(params)
  } catch {
  | _ =>
    Js.log("Fill params fail.")
    ""
  }
}
