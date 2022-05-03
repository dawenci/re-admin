@module("bizcharts") @react.component
external make: (
  ~showTitle: bool=?,
  ~title: string=?,
  ~showMarkers: bool=?,
  ~marker: 'marker=?,
  ~showContent: bool=?,
  ~position: [#left | #right | #top | #bottom]=?,
  ~shared: bool=?,
  ~follow: bool=?,
  ~offset: float=?,
  ~enterable: bool=?,
  ~lock: bool=?,
  ~showCrosshairs: bool=?,
  ~crosshairs: 'crosshairs=?,
  ~container: 'container=?,
  ~linkage: 'linkage=?,
  ~containerTpl: string=?,
  ~itemTpl: string=?,
  ~domStyles: 'domStyles=?,
  ~region: 'region=?,
  unit
) => React.element = "Tooltip"
