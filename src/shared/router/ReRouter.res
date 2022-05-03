module History = ReRouter_History
module Path = ReRouter_Path
module Param = ReRouter_Param
module Query = ReRouter_Query
module Meta = ReRouter_Meta
module Location = ReRouter_Location
module Context = ReRouter_Context
module Route = ReRouter_Route
module Switch = ReRouter_Switch
module Match = ReRouter_Match
module Link = ReRouter_Link

let push = ReRouter_Navigator.push
let replace = ReRouter_Navigator.replace

@react.component
let make = (
  ~mode: [#History | #Hash]=#Hash,
  ~children=React.null,
  ~beforeNavigate: option<unit => unit>=?,
) => {

  let location = Location.useLocation()

  let url = switch mode {
  | #History =>
    location.path->List.reduce("", (acc, current) => acc ++ "/" ++ current) ++ "?" ++ location.search
  | #Hash => location.hash->Js.String2.charAt(0) == "/" ? location.hash : "/" ++ location.hash
  }

  let contextValue: ReRouter_Context.t = {
    mode: mode,
    url: url,
    location: location,
    match: ReRouter_Match.root(()),
  }

  switch beforeNavigate {
  | Some(beforeNavigate) => beforeNavigate()
  | None => ()
  }

  <ReRouter_Context.Provider value={Some(contextValue)}>
  {children}
  </ReRouter_Context.Provider>
}
