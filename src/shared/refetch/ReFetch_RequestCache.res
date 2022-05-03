type t =
  | Default
  | NoStore
  | Reload
  | NoCache
  | ForceCache
  | OnlyIfCached
let convertRequestCache: t => Fetch.requestCache = v => {
  switch v {
  | Default => Fetch.Default
  | NoStore => Fetch.NoStore
  | Reload => Fetch.Reload
  | NoCache => Fetch.NoCache
  | ForceCache => Fetch.ForceCache
  | OnlyIfCached => Fetch.OnlyIfCached
  }
}