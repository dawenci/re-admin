// dayjs binding

type t
type basicUnits = [
  | #year
  | #y
  | #month
  | #M
  | #hour
  | #h
  | #minute
  | #m
  | #second
  | #s
  | #millisecond
  | #ms
]

// Parser
@module("dayjs") external parse: 'a => t = "default"

@module("dayjs") external fromDayjs: t => t = "default"

@module("dayjs") external now: unit => t = "default"

@module("dayjs") external fromString: string => t = "default"

@module("dayjs") external fromJsDate: Js.Date.t => t = "default"

@module("dayjs") external fromTimestamp: float => t = "default"

@module("dayjs") external fromUnix: float => t = "default"

@send external clone: t => t = "clone"
@send external isValid: t => bool = "isValid"

// Get + Set
@send external getYear: t => float = "year"
@send external setYear: (t, float) => t = "year"
@send external getMonth: t => float = "month"
@send external setMonth: (t, float) => t = "month"
@send external getDate: t => float = "date"
@send external setDate: (t, float) => t = "date"
@send external getDay: t => float = "day"
@send external setDay: (t, float) => t = "day"
@send external getHour: t => float = "hour"
@send external setHour: (t, float) => t = "hour"
@send external getMinute: t => float = "minute"
@send external setMinute: (t, float) => t = "minute"
@send external getSecond: t => float = "second"
@send external setSecond: (t, float) => t = "second"
@send external getMillisecond: t => float = "millisecond"
@send external setMillisecond: (t, float) => t = "millisecond"

type unitType = [
  | basicUnits
  | #date
  | #D
  | #day
  | #d
]
@send external get: (t, unitType) => float = "get"
@send external set: (t, unitType, float) => t = "set"

// Manipulate
type opUnitType = [
  | basicUnits
  | #day
  | #d
  | #week
  | #w
  | #quarter
  | #Q
]
@send external add: (t, float, opUnitType) => t = "add"
@send external subtract: (t, float, opUnitType) => t = "subtract"

type opUnitType2 = [unitType | #quarter | #Q | #week | #w | #isoWeek]
@send external startOf: (t, opUnitType2) => t = "startOf"
@send external endOf: (t, opUnitType2) => t = "endOf"

// Display
@send external formatDefault: t => string = "format"
@send external format: (t, string) => string = "format"
@send external diffDefault: (t, t) => float = "diff"
@send external diff: (t, t, opUnitType) => float = "diff"
@send external diffWithPrecision: (t, t, opUnitType, bool) => float = "diff"
@send external valueOf: t => float = "valueOf"
@send external unix: t => float = "unix"
@send external daysInMonth: t => float = "daysInMonth"
@send external toDate: t => Js.Date.t = "toDate"
@send external toJSON: t => string = "toJSON"
@send external toISOString: t => string = "toISOString"
@send external toString: t => string = "toString"

// Query
@send external isBefore: (t, t) => bool = "isBefore"
@send external isBeforeBy: (t, t, unitType) => bool = "isBefore"
@send external isBeforeParsableBy: (t, 'a, unitType) => bool = "isBefore"
@send external isSame: (t, t) => bool = "isSame"
@send external isSameBy: (t, t, unitType) => bool = "isSame"
@send external isSameParsableBy: (t, 'a, unitType) => bool = "isBefore"
@send external isAfter: (t, t) => bool = "isAfter"
@send external isAfterBy: (t, t, unitType) => bool = "isAfter"
@send external isAfterParsableBy: (t, 'a, unitType) => bool = "isBefore"
@module("dayjs") external isDayjs: 'a => bool = "isDayjs"

// i18n
@module("dayjs") external getLocaleGlobally: unit => string = "locale"
@module("dayjs") external setLocaleGlobally: string => unit = "locale"
@send external getLocale: (t) => string = "locale"
@send external setLocale: (t, string) => t = "locale"

// extend
@module("dayjs") external extend: 'plugin => unit = "extend"
