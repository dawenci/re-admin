@module("bizcharts") @react.component
external make: (
  ~position: string,
  ~color: 'color=?,
  ~label: 'label=?,
  ~tooltip: bool=?,
  ~animate: bool=?,
) => React.element = "Heatmap"
