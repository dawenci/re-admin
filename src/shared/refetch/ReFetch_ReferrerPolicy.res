type t =
  | None
  | NoReferrer
  | NoReferrerWhenDowngrade
  | SameOrigin
  | Origin
  | StrictOrigin
  | OriginWhenCrossOrigin
  | StrictOriginWhenCrossOrigin
  | UnsafeUrl
let convertReferrerPolicy: t => Fetch.referrerPolicy = policy => {
  switch policy {
  | None => Fetch.None
  | NoReferrer => Fetch.NoReferrer
  | NoReferrerWhenDowngrade => Fetch.NoReferrerWhenDowngrade
  | SameOrigin => Fetch.SameOrigin
  | Origin => Fetch.Origin
  | StrictOrigin => Fetch.StrictOrigin
  | OriginWhenCrossOrigin => Fetch.OriginWhenCrossOrigin
  | StrictOriginWhenCrossOrigin => Fetch.StrictOriginWhenCrossOrigin
  | UnsafeUrl => Fetch.UnsafeUrl
  }
}