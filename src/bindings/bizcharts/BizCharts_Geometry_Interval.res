@module("bizcharts") @react.component
external make: (
  ~position: string,
  ~color: 'color=?,
  ~label: 'label=?,
  ~adjust: 'adjust=?,
  ~shape: 'shape=?,
  ~size: 'size=?,
  ~tooltip: bool=?,
  ~style: G2_ShapeAttrs.t=?,
  ~animate: bool=?,
) => React.element = "Interval"
