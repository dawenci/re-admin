module ProgressEvent = {
  type t = Dom.event

  @new external make: ('type_, 'options) => t = "ProgressEvent"

  @get external lengthComputable: t => bool = "lengthComputable"
  @get external loaded: t => float = "loaded"
  @get external total: t => float = "total"
}

module XMLHttpRequestEventTarget = {
  type t

  module Impl = (T: { type t }) => {
    include Webapi.Dom.EventTarget.Impl({ type t = T.t })

    @get external onreadystatechange: T.t => 'cb = "onreadystatechange"
    @set external setOnreadystatechange: (T.t, 'cb) => unit = "onreadystatechange"

    @get external onabort: T.t => 'cb = "onabort"
    @set external setOnabort: (T.t, 'cb) => unit = "onabort"

    @get external onerror: T.t => 'cb = "onerror"
    @set external setOnerror: (T.t, 'cb) => unit = "onerror"

    @get external onload: T.t => 'cb = "onload"
    @set external setOnload: (T.t, 'cb) => unit = "onload"

    @get external onloadend: T.t => 'cb = "onloadend"
    @set external setOnloadend: (T.t, 'cb) => unit = "onloadend"

    @get external onloadstart: T.t => 'cb = "onloadstart"
    @set external setOnloadstart: (T.t, 'cb) => unit = "onloadstart"

    @get external onprogress: T.t => 'cb = "onprogress"
    @set external setOnprogress: (T.t, 'cb) => unit = "onprogress"

    @get external ontimeout: T.t => 'cb = "ontimeout"
    @set external setOntimeout: (T.t, 'cb) => unit = "ontimeout"
  }

  include Impl({ type t = t })
}

module XMLHttpRequestUpload = {
  type t
  include XMLHttpRequestEventTarget.Impl({ type t = t })
}

type t

include XMLHttpRequestEventTarget.Impl({ type t = t })

type responseType = [#text | #arraybuffer | #blob | #document | #json | #text | #"ms-stream"]

type readyState =
  | UNSENT
  | OPENED
  | HEADERS_RECEIVED
  | LOADING
  | DONE

@new external make: unit => t = "XMLHttpRequest"

@get external onreadystatechange: t => 'a = "onreadystatechange"
@set external setOnreadystatechange: (t, 'a) => unit = "onreadystatechange"

@get external readyState: t => readyState = "readyState"
@get external response: t => 'a = "response"
@get external responseText: t => 'a = "responseText"

@get external responseType: t => responseType = "responseType"
@set external setResponseType: (t, responseType) => unit = "responseType"

@get external responseURL: t => string = "responseURL"
@get external responseXML: t => 'a = "responseXML"
@get external status: t => int = "status"
@get external statusText: t => string = "statusText"

@get external timeout: t => int = "timeout"
@set external setTimeout: (t, int) => unit = "timeout"

@get external upload: t => XMLHttpRequestUpload.t = "upload"

@get external withCredentials: t => bool = "withCredentials"
@set external setWithCredentials: (t, bool) => unit = "withCredentials"

@send external abort: t => unit = "abort"
@send external getAllResponseHeaders: t => 'a = "getAllResponseHeaders"
@send @return(nullable) external getResponseHeader: (t, string) => option<string> = "getResponseHeader"
@send external open1: (t, 'domString, string) => unit = "open"
@send external open2: (t, 'domString, string, bool) => unit = "open"
@send external open3: (t, 'domString, string, bool, string) => unit = "open"
@send external open4: (t, 'domString, string, bool, string, string) => unit = "open"
@send external overrideMimeType: (t, 'domString) => unit = "overrideMimeType"
@send external send: (t) => unit = "send"
@send external sendBody: (t, 'body) => unit = "send"
@send external setRequestHeader: (t, string, string) => unit = "setRequestHeader"

// 解析 getAllResponseHeaders 的结果
let ignoreDuplicateOf = [
  "age", "authorization", "content-length", "content-type", "etag",
  "expires", "from", "host", "if-modified-since", "if-unmodified-since",
  "last-modified", "location", "max-forwards", "proxy-authorization",
  "referer", "retry-after", "user-agent"
]
let parseHeaders = headers => {
  let parsed = Js.Dict.empty()
  if headers != "" {
    let lines = headers->Js.String2.split("\n")
    lines
    ->Js.Array2.forEach(line => {
      let i = line->Js.String2.indexOf(":")
      let key = Js.String2.substrAtMost(line, ~from=0, ~length=i)->Js.String2.trim->Js.String2.toLowerCase
      if key != "" {
        let val = Js.String2.substr(line, ~from=i + 1)->Js.String2.trim
        let maybeDuplicate = Js.Dict.get(parsed, key)
        let ignore = Js.Array2.includes(ignoreDuplicateOf, key)

        // 不重复，或允许重复
        let duplicate = Option.isSome(maybeDuplicate)
        if !duplicate || !ignore {
          // axios 等库对于 "set-cookie" 会特殊处理
          let val = duplicate ? Option.getExn(maybeDuplicate) ++ ", " ++ val : val
          Js.Dict.set(parsed, key, val)
        }
      }
    })
  }

  parsed
}
