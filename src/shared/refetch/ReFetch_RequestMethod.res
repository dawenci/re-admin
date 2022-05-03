type t =
  | Get
  | Head
  | Post
  | Put
  | Delete
  | Connect
  | Options
  | Trace
  | Patch
  | Other(string)

let convertRequestMethod: t => Fetch.requestMethod = method => {
  switch method {
  | Get => Fetch.Get
  | Head => Fetch.Head
  | Post => Fetch.Post
  | Put => Fetch.Put
  | Delete => Fetch.Delete
  | Connect => Fetch.Connect
  | Options => Fetch.Options
  | Trace => Fetch.Trace
  | Patch => Fetch.Patch
  | Other(method) => Fetch.Other(method)
  }
}

let decode: t => string = method => {
  switch method {
  | Get => "GET"
  | Head => "HEAD"
  | Post => "POST"
  | Put => "PUT"
  | Delete => "DELETE"
  | Connect => "CONNECT"
  | Options => "OPTIONS"
  | Trace => "TRACE"
  | Patch => "PATCH"
  | Other(method) => method
  }
}
