type t = Fetch.readableStream
@new external make: 'a => t = "ReadableStream"

type controller
type reader

type iterator = {done: bool, value: Js.TypedArray2.Uint8Array.t}

@send external getReader: t => reader = "getReader"
@send external read: reader => Promise.t<iterator> = "read"

@send external enqueue: (controller, Js.TypedArray2.Uint8Array.t) => unit = "enqueue"
@send external close: controller => unit = "close"
