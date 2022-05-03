type t
type lifecycleEvent = (BizCharts_Event.t, G2.Chart.t) => unit

@module("bizcharts") @react.component
external make: (
  ~name: string=?,
  ~visible: bool=?,
  ~position: [#top|#right|#bottom|#left]=?,
  ~title: 'title=?,
  ~line: 'line=?,
  ~tickLine: 'line=?,
  ~label: 'label=?,
  ~grid: 'grid=?,
  ~subTickLine: 'line=?,
  ~animate: bool=?,
  ~verticalFactor: float=?,
) => React.element = "Axis"
