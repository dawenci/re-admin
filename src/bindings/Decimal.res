type rounding =
  | ROUND_UP
  | ROUND_DOWN
  | ROUND_CEIL
  | ROUND_FLOOR
  | ROUND_HALF_UP
  | ROUND_HALF_DOWN
  | ROUND_HALF_EVEN
  | ROUND_HALF_CEIL
  | ROUND_HALF_FLOOR

module Properties = {
  @deriving(abstract)
  type t = {
    @optional precision: int,
    @optional rounding: rounding,
    @optional toExpNeg: int,
    @optional toExpPos: int,
    @optional @as("LN10") ln10: string
  }
}

module Instance = {
  type t

  @send external abs: t => t = "abs"
  @send external cmp: (t, @unwrap [#Number(float) | #String(string) | #Decimal(t)]) => int = "cmp"
  @send external dp: t => int = "dp"
  @send external div: (t, @unwrap [#Number(float) | #String(string) | #Decimal(t)]) => t = "div"
  @send external idiv: (t, @unwrap [#Number(float) | #String(string) | #Decimal(t)]) => t = "idiv"
  @send external eq: (t, @unwrap [#Number(float) | #String(string) | #Decimal(t)]) => bool = "eq"
  @send external exponent: t => int = "exponent"
  @send external gt: (t, @unwrap [#Number(float) | #String(string) | #Decimal(t)]) => bool = "gt"
  @send external gte: (t, @unwrap [#Number(float) | #String(string) | #Decimal(t)]) => bool = "gte"
  @send external isint: t => bool = "isint"
  @send external isneg: t => bool = "isneg"
  @send external ispos: t => bool = "ispos"
  @send external isZero: t => bool = "isZero"
  @send external lt: (t, @unwrap [#Number(float) | #String(string) | #Decimal(t)]) => bool = "lt"
  @send external lte: (t, @unwrap [#Number(float) | #String(string) | #Decimal(t)]) => bool = "lte"
  @send external log: (t, @unwrap [#Number(float) | #String(string) | #Decimal(t)]) => t = "log"
  @send external minus: (t, @unwrap [#Number(float) | #String(string) | #Decimal(t)]) => t = "minus"
  @send external mod: (t, @unwrap [#Number(float) | #String(string) | #Decimal(t)]) => t = "mod"
  @send external exp: t => t = "exp"
  @send external ln: t => t = "ln"
  @send external neg: t => t = "neg"
  @send external plus: (t, @unwrap [#Number(float) | #String(string) | #Decimal(t)]) => t = "plus"
  @send external sd: (t, option<bool>) => int = "sd"
  @send external sqrt: t => t = "sqrt"
  @send external times: (t, @unwrap [#Number(float) | #String(string) | #Decimal(t)]) => t = "times"
  @send external todp: (t, ~dp: int=?, ~rm: rounding=?, unit) => t = "todp"
  @send external toExponential: (t, ~dp: int=?, ~rm: rounding=?, unit) => string = "toExponential"
  @send external toFixed: (t, ~dp: int=?, ~rm: rounding=?, unit) => string = "toFixed"
  @send external toint: t => t = "toint"
  @send external toJSON: t => string = "toJSON"
  @send external toNumber: t => float = "toNumber"
  @send external pow: (t, @unwrap [#Number(float) | #String(string) | #Decimal(t)]) => t = "pow"
  @send external toPrecision: (t, ~sd: int=?, ~rm: rounding=?, unit) => string = "toPrecision"
  @send external tosd: (t, ~sd: int=?, ~rm: rounding=?, unit) => t = "tosd"
  @send external toString: t => string = "toString"
  @send external valueOf: t => string = "valueOf"

  @get external d: t => array<int> = "d"
  @get external e: t => int = "e"
  @get external s: t => int = "s"
}

module Ctor = {
  type arg
  external arg: 'a => arg = "%identity"

  type t = arg => Instance.t

  @module("decimal.js-light") external ctor: t = "default"

  @send external clone: (t, Properties.t) => t = "clone"
  @send external config: (t, Properties.t) => t = "config"

  @get external precision: t => int = "precision"
  @get external rounding: t => rounding = "rounding"
  @get external toExpNeg: t => int = "toExpNeg"
  @get external toExpPos: t => int = "toExpPos"
  @get external ln10: t => 'a = "LN10"
}

@module("decimal.js-light") @new
external make: @unwrap [#Number(float) | #String(string) | #Decimal(Instance.t)] => Instance.t =
  "default"

let makeBy: (Ctor.t, [#Number(float) | #String(string) | #Decimal(Instance.t)]) => Instance.t = (
  ctor,
  input,
) => {
  switch input {
  | #Number(value) => ctor(Ctor.arg(value))
  | #String(value) => ctor(Ctor.arg(value))
  | #Decimal(value) => ctor(Ctor.arg(value))
  }
}
