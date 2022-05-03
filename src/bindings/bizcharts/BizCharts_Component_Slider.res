@module("bizcharts") @react.component
external make: (
  ~height: float=?,
  ~trendCfg: 'trendCfg=?,
  ~backgroundStyle: 'style=?,
  ~foregroundStyle: 'style=?,
  ~handlerStyle: 'style=?,
  ~textStyle: 'style=?,
  ~minLimit: float=?,
  ~maxLimit: float=?,
  ~start: float=?,
  ~end: float=?,
  ~formatter: ('value, 'datum, int) => unit=?,
) => React.element = "Slider"
