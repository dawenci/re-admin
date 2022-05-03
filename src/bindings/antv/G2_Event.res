module GraphEvent = {
  type t
}

module Event = {
  type view
  type data

  type t = {
    _type: string,
    view: view,
    gEvent: GraphEvent.t,
    data: option<data>,
  }
}
