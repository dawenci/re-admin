type t = Fetch.signal

include Webapi.Dom.EventTarget.Impl({
  type t = t
})
@get external aborted: t => bool = "aborted"
@set external setOnabort: (t, 'cb) => unit = "onabort"
