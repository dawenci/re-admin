external asBool: 'a => bool = "%identity"

let has = (_obj, _prop: string) => {
  asBool(%raw("_prop in _obj"))
}

let hasOwnProperty = %raw(`Object.prototype.hasOwnProperty`)
let hasOwn = (_obj, _prop: string) => {
  asBool(%raw("hasOwnProperty.call(_obj, _prop)"))
}

let instanceof = (_obj, _klass) => {
  asBool(%raw("_obj instanceof _klass"))
}
