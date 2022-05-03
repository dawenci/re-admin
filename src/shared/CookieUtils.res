type cookiePair = (string, option<string>)

let monthInMs = 30. *. 24. *. 60. *. 60. *. 1000.

let parseCookies: unit => array<cookiePair> = () =>
  Webapi.Dom.document
  ->Webapi.Dom.Document.asHtmlDocument
  ->Option.getExn
  ->Webapi.Dom.HtmlDocument.cookie
  ->Js.String2.split(";")
  ->Array.reduce([], (acc, str) => {
    let pair = str->Js.String2.split("=")->Array.map(Js.String.trim)
    let key = pair->Array.getExn(0)
    let value = pair->Array.get(1)

    acc->Array.concat([(key, value)])
  })

let getCookiePair = (name: string): option<cookiePair> =>
  parseCookies()->Js.Array2.find(pair => {
    let key = fst(pair)
    key == name
  })

let getCookie = (name: string): option<string> => getCookiePair(name)->Option.flatMap(snd)

let setCookieRaw: (
  ~key: string,
  ~value: string=?,
  ~expires: string,
  ~path: string=?,
  unit,
) => unit = (~key, ~value=?, ~expires, ~path=?, ()) => {
  let htmlDocument = Webapi.Dom.document->Webapi.Dom.Document.asHtmlDocument->Option.getExn

  let value = value->Option.getWithDefault("")
  let expires = expires !== "" ? `expires=${expires};` : ""
  let path =
    path
    ->Option.flatMap(path => path == "" ? None : Some(path))
    ->Option.map(path => ` path=${path};`)
    ->Option.getWithDefault("")
  let cookie = `${key}=${value};${expires}${path}`

  Webapi.Dom.HtmlDocument.setCookie(htmlDocument, cookie)
}

let setCookie: (string, option<string>) => unit = (key, value) => {
  let expires = Js.Date.make()
  let _ = Js.Date.setTime(expires, Js.Date.getTime(expires) +. monthInMs)

  setCookieRaw(~key, ~value?, ~expires=expires->Js.Date.toUTCString, ~path="/", ())
}

let deleteCookie: string => unit = key =>
  setCookieRaw(~key, ~expires="Thu, 01 Jan 1970 00:00:01 GMT", ())
