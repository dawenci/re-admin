type val = [#Str(string) | #Num(float) | #Bool(bool)]
type t = Js.Dict.t<val>
let make = Js.Dict.fromArray
let empty = Js.Dict.empty
