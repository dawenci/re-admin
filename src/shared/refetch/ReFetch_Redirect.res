type t =
  | Follow
  | Error
  | Manual
let convertRequestRedirect: t => Fetch.requestRedirect = v => {
  switch v {
  | Follow => Fetch.Follow
  | Error => Fetch.Error
  | Manual => Fetch.Manual
  }
}