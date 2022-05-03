let encodeReserveRE = %re("/[!'()*]/g")
let encodeReserveReplacer = (c, _, _) =>
  "%" ++ c->Js.String2.charCodeAt(0)->Js.Float.toStringWithRadix(~radix=16)
let commaRE = %re("/%2C/g")

@send external encodeURIComponent: (Dom.window, string) => string = "encodeURIComponent"
@send external decodeURIComponent: (Dom.window, string) => string = "decodeURIComponent"

let encode = (str: string) =>
  encodeURIComponent(Webapi.Dom.window, str)
  ->Js.String2.unsafeReplaceBy0(encodeReserveRE, encodeReserveReplacer)
  ->Js.String2.replaceByRe(commaRE, ",")

let decode = (str: string) => {
  try {
    decodeURIComponent(Webapi.Dom.window, str)
  } catch {
  | _ => str
  }
}
