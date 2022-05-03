type t

type stateName = [#active | #selected | #inactive]

@send external changeVisible: (t, bool) => unit = "changeVisible"
@send external setState: (t, stateName, bool) => unit = "setState"
@send external clearStates: t => unit = "clearStates"
@send external hasState: (t, stateName) => bool = "hasState"
@send external getStates: t => array<stateName> = "getStates"
@send external getData: t => 'datum = "getData"
@send external getModel: t => 'shapeInfo = "getModel"
@send external getBBox: t => 'bbox = "getBBox"
