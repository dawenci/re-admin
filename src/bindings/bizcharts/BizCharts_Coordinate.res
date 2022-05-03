@module("bizcharts") @react.component
external make: (
  ~_type: [#cartesian | #rect | #polar | #theta | #helix]=?,
  ~rotate: float=?,
  ~scale: (float, float)=?,
  ~reflect: [#x | #y]=?,
  ~transpose: bool=?,
  ~actions: 'actions=?,
) => React.element = "Coordinate"
