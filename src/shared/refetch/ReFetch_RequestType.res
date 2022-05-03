type t =
  | None
  | Audio
  | Font
  | Image
  | Script
  | Style
  | Track
  | Video
let convertRequestType: t => Fetch.requestType = v => {
  switch v {
  | None => Fetch.None
  | Audio => Fetch.Audio
  | Font => Fetch.Font
  | Image => Fetch.Image
  | Script => Fetch.Script
  | Style => Fetch.Style
  | Track => Fetch.Track
  | Video => Fetch.Video
  }
}