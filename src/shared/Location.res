type t

external make: string => t = "%identity"
external toString: t => string = "%identity"

let push: t => unit = location => location->toString->RescriptReactRouter.push
