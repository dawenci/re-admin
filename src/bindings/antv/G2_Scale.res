module ScaleType = {
  type t = [
    | #cat
    | #timeCat
    | #linear
    | #"linear-strict"
    | #time
    | #log
    | #pow
    | #quantize
    | #quantile
    | #identity
  ]
}

module ScaleConfig = {
  type value
  external value: 'a => value = "%identity"

  type ticks
  external ticks: 'a => ticks = "%identity"

  type formatter
  external formatter: 'a => formatter = "%identity"

  type tickMethod
  external tickMethod: 'a => tickMethod = "%identity"

  type max
  external max: 'a => max = "%identity"

  type min
  external min: 'a => min = "%identity"

  type maxLimit
  external maxLimit: 'a => maxLimit = "%identity"

  type minLimit
  external minLimit: 'a => minLimit = "%identity"

  @deriving(abstract)
  type t = {
    @optional field: string,
    @optional values: array<value>,
    @optional range: (float, float),
    @optional max: max,
    @optional min: min,
    @optional minLimit: minLimit,
    @optional maxLimit: maxLimit,
    @optional alias: string,
    @optional base: float,
    @optional exponent: float,
    @optional nice: bool,
    @optional ticks: ticks,
    @optional tickInterval: float,
    @optional minTickInterval: float,
    @optional tickCount: int,
    @optional maxTickCount: int,
    @optional formatter: formatter,
    @optional tickMethod: tickMethod,
    @optional mask: string,
  }
}

module ScaleOption = {
  let value = ScaleConfig.value
  let ticks = ScaleConfig.ticks
  let formatter = ScaleConfig.formatter
  let tickMethod = ScaleConfig.tickMethod
  let max = ScaleConfig.max
  let min = ScaleConfig.min
  let maxLimit = ScaleConfig.maxLimit
  let minLimit = ScaleConfig.minLimit

  module Sync = {
    type t
    external bool: bool => t = "%identity"
    external string: string => t = "%identity"
  }

  @deriving(abstract)
  type t = {
    @optional @as("type") _type: ScaleType.t,
    @optional key: bool,
    @optional showLast: bool,
    @optional sync: Sync.t,
    
    @optional field: string,
    @optional values: array<ScaleConfig.value>,
    @optional range: (float, float),
    @optional max: ScaleConfig.max,
    @optional min: ScaleConfig.min,
    @optional minLimit: ScaleConfig.minLimit,
    @optional maxLimit: ScaleConfig.maxLimit,
    @optional alias: string,
    @optional base: float,
    @optional exponent: float,
    @optional nice: bool,
    @optional ticks: ScaleConfig.ticks,
    @optional tickInterval: float,
    @optional minTickInterval: float,
    @optional tickCount: int,
    @optional maxTickCount: int,
    @optional formatter: ScaleConfig.formatter,
    @optional tickMethod: ScaleConfig.tickMethod,
    @optional mask: string,
  }

  let cat = (
    ~key: option<bool>=?,
    ~sync: option<Sync.t>=?,
    ~field: option<string>=?,
    ~values: option<array<ScaleConfig.value>>=?,
    ~range: option<(float, float)>=?,
    ~alias: option<string>=?,
    ~nice: option<bool>=?,
    ~ticks: option<ScaleConfig.ticks>=?,
    ~tickInterval: option<float>=?,
    ~tickCount: option<int>=?,
    ~maxTickCount: option<int>=?,
    ~formatter: option<ScaleConfig.formatter>=?,
    ~tickMethod: option<ScaleConfig.tickMethod>=?,
    (),
  ) => {
    t(
      ~_type=#cat,
      ~key?,
      ~sync?,
      ~field?,
      ~values?,
      ~range?,
      ~alias?,
      ~nice?,
      ~ticks?,
      ~tickInterval?,
      ~tickCount?,
      ~maxTickCount?,
      ~formatter?,
      ~tickMethod?,
      (),
    )
  }

  let timeCat = (
    ~key: option<bool>=?,
    ~sync: option<Sync.t>=?,
    ~field: option<string>=?,
    ~values: option<array<ScaleConfig.value>>=?,
    ~range: option<(float, float)>=?,
    ~alias: option<string>=?,
    ~nice: option<bool>=?,
    ~ticks: option<ScaleConfig.ticks>=?,
    ~tickInterval: option<float>=?,
    ~tickCount: option<int>=?,
    ~maxTickCount: option<int>=?,
    ~formatter: option<ScaleConfig.formatter>=?,
    ~tickMethod: option<ScaleConfig.tickMethod>=?,
    ~mask: option<string>=?,
    (),
  ) => {
    t(
      ~_type=#timeCat,
      ~key?,
      ~sync?,
      ~field?,
      ~values?,
      ~range?,
      ~alias?,
      ~nice?,
      ~ticks?,
      ~tickInterval?,
      ~tickCount?,
      ~maxTickCount?,
      ~formatter?,
      ~tickMethod?,
      ~mask?,
      (),
    )
  }

  let linear = (
    ~key: option<bool>=?,
    ~showLast: option<bool>=?,
    ~sync: option<Sync.t>=?,
    ~field: option<string>=?,
    ~values: option<array<ScaleConfig.value>>=?,
    ~range: option<(float, float)>=?,
    ~alias: option<string>=?,
    ~nice: option<bool>=?,
    ~ticks: option<ScaleConfig.ticks>=?,
    ~tickInterval: option<float>=?,
    ~minTickInterval: option<float>=?,
    ~tickCount: option<int>=?,
    ~maxTickCount: option<int>=?,
    ~formatter: option<ScaleConfig.formatter>=?,
    ~tickMethod: option<ScaleConfig.tickMethod>=?,
    (),
  ) => {
    t(
      ~_type=#cat,
      ~key?,
      ~showLast?,
      ~sync?,
      ~field?,
      ~values?,
      ~range?,
      ~alias?,
      ~nice?,
      ~ticks?,
      ~tickInterval?,
      ~minTickInterval?,
      ~tickCount?,
      ~maxTickCount?,
      ~formatter?,
      ~tickMethod?,
      (),
    )
  }

  let linearStrict = (
    ~key: option<bool>=?,
    ~sync: option<Sync.t>=?,
    ~field: option<string>=?,
    ~values: option<array<ScaleConfig.value>>=?,
    ~range: option<(float, float)>=?,
    ~alias: option<string>=?,
    ~nice: option<bool>=?,
    ~ticks: option<ScaleConfig.ticks>=?,
    ~tickInterval: option<float>=?,
    ~minTickInterval: option<float>=?,
    ~tickCount: option<int>=?,
    ~maxTickCount: option<int>=?,
    ~formatter: option<ScaleConfig.formatter>=?,
    ~tickMethod: option<ScaleConfig.tickMethod>=?,
    (),
  ) => {
    t(
      ~_type=#cat,
      ~key?,
      ~sync?,
      ~field?,
      ~values?,
      ~range?,
      ~alias?,
      ~nice?,
      ~ticks?,
      ~tickInterval?,
      ~minTickInterval?,
      ~tickCount?,
      ~maxTickCount?,
      ~formatter?,
      ~tickMethod?,
      (),
    )
  }

  let time = (
    ~key: option<bool>=?,
    ~showLast: option<bool>=?,
    ~sync: option<Sync.t>=?,
    ~field: option<string>=?,
    ~values: option<array<ScaleConfig.value>>=?,
    ~range: option<(float, float)>=?,
    ~alias: option<string>=?,
    ~nice: option<bool>=?,
    ~ticks: option<ScaleConfig.ticks>=?,
    ~tickInterval: option<float>=?,
    ~tickCount: option<int>=?,
    ~maxTickCount: option<int>=?,
    ~formatter: option<ScaleConfig.formatter>=?,
    ~tickMethod: option<ScaleConfig.tickMethod>=?,
    ~mask: option<string>=?,
    (),
  ) => {
    t(
      ~_type=#cat,
      ~key?,
      ~showLast?,
      ~sync?,
      ~field?,
      ~values?,
      ~range?,
      ~alias?,
      ~nice?,
      ~ticks?,
      ~tickInterval?,
      ~tickCount?,
      ~maxTickCount?,
      ~formatter?,
      ~tickMethod?,
      ~mask?,
      (),
    )
  }

  let log = (
    ~key: option<bool>=?,
    ~sync: option<Sync.t>=?,
    ~field: option<string>=?,
    ~values: option<array<ScaleConfig.value>>=?,
    ~range: option<(float, float)>=?,
    ~alias: option<string>=?,
    ~base: option<float>=?,
    ~nice: option<bool>=?,
    ~ticks: option<ScaleConfig.ticks>=?,
    ~tickInterval: option<float>=?,
    ~tickCount: option<int>=?,
    ~maxTickCount: option<int>=?,
    ~formatter: option<ScaleConfig.formatter>=?,
    ~tickMethod: option<ScaleConfig.tickMethod>=?,
    (),
  ) => {
    t(
      ~_type=#cat,
      ~key?,
      ~sync?,
      ~field?,
      ~values?,
      ~range?,
      ~alias?,
      ~base?,
      ~nice?,
      ~ticks?,
      ~tickInterval?,
      ~tickCount?,
      ~maxTickCount?,
      ~formatter?,
      ~tickMethod?,
      (),
    )
  }

  let pow = (
    ~key: option<bool>=?,
    ~sync: option<Sync.t>=?,
    ~field: option<string>=?,
    ~values: option<array<ScaleConfig.value>>=?,
    ~range: option<(float, float)>=?,
    ~alias: option<string>=?,
    ~exponent: option<float>=?,
    ~nice: option<bool>=?,
    ~ticks: option<ScaleConfig.ticks>=?,
    ~tickInterval: option<float>=?,
    ~tickCount: option<int>=?,
    ~maxTickCount: option<int>=?,
    ~formatter: option<ScaleConfig.formatter>=?,
    ~tickMethod: option<ScaleConfig.tickMethod>=?,
    (),
  ) => {
    t(
      ~_type=#cat,
      ~key?,
      ~sync?,
      ~field?,
      ~values?,
      ~range?,
      ~alias?,
      ~exponent?,
      ~nice?,
      ~ticks?,
      ~tickInterval?,
      ~tickCount?,
      ~maxTickCount?,
      ~formatter?,
      ~tickMethod?,
      (),
    )
  }

  let quantize = (
    ~key: option<bool>=?,
    ~sync: option<Sync.t>=?,
    ~field: option<string>=?,
    ~values: option<array<ScaleConfig.value>>=?,
    ~range: option<(float, float)>=?,
    ~alias: option<string>=?,
    ~nice: option<bool>=?,
    ~ticks: option<ScaleConfig.ticks>=?,
    ~tickInterval: option<float>=?,
    ~tickCount: option<int>=?,
    ~maxTickCount: option<int>=?,
    ~formatter: option<ScaleConfig.formatter>=?,
    ~tickMethod: option<ScaleConfig.tickMethod>=?,
    (),
  ) => {
    t(
      ~_type=#cat,
      ~key?,
      ~sync?,
      ~field?,
      ~values?,
      ~range?,
      ~alias?,
      ~nice?,
      ~ticks?,
      ~tickInterval?,
      ~tickCount?,
      ~maxTickCount?,
      ~formatter?,
      ~tickMethod?,
      (),
    )
  }

  let quantile = (
    ~key: option<bool>=?,
    ~sync: option<Sync.t>=?,
    ~field: option<string>=?,
    ~values: option<array<ScaleConfig.value>>=?,
    ~range: option<(float, float)>=?,
    ~alias: option<string>=?,
    ~nice: option<bool>=?,
    ~ticks: option<ScaleConfig.ticks>=?,
    ~tickInterval: option<float>=?,
    ~tickCount: option<int>=?,
    ~maxTickCount: option<int>=?,
    ~formatter: option<ScaleConfig.formatter>=?,
    ~tickMethod: option<ScaleConfig.tickMethod>=?,
    (),
  ) => {
    t(
      ~_type=#cat,
      ~key?,
      ~sync?,
      ~field?,
      ~values?,
      ~range?,
      ~alias?,
      ~nice?,
      ~ticks?,
      ~tickInterval?,
      ~tickCount?,
      ~maxTickCount?,
      ~formatter?,
      ~tickMethod?,
      (),
    )
  }

  let identity = (
    ~key: option<bool>=?,
    ~sync: option<Sync.t>=?,
    ~field: option<string>=?,
    ~values: option<array<ScaleConfig.value>>=?,
    ~range: option<(float, float)>=?,
    ~alias: option<string>=?,
    ~nice: option<bool>=?,
    ~ticks: option<ScaleConfig.ticks>=?,
    ~tickInterval: option<float>=?,
    ~tickCount: option<int>=?,
    ~maxTickCount: option<int>=?,
    ~formatter: option<ScaleConfig.formatter>=?,
    ~tickMethod: option<ScaleConfig.tickMethod>=?,
    (),
  ) => {
    t(
      ~_type=#cat,
      ~key?,
      ~sync?,
      ~field?,
      ~values?,
      ~range?,
      ~alias?,
      ~nice?,
      ~ticks?,
      ~tickInterval?,
      ~tickCount?,
      ~maxTickCount?,
      ~formatter?,
      ~tickMethod?,
      (),
    )
  }

  external unsafeMake: 'a => t = "%identity"
}
