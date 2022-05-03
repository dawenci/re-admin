type t =
  | Omit
  | SameOrigin
  | Include
let convertRequestCredentials: t => Fetch.requestCredentials = v => {
  switch v {
  | Omit => Fetch.Omit
  | SameOrigin => Fetch.SameOrigin
  | Include => Fetch.Include
  }
}