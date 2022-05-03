@module("bizcharts") @react.component
external make: (
  // 通用
  ~top: bool=?,
  ~style: G2_ShapeAttrs.t=?,
  ~animate: bool=?,
  ~offsetX: float=?,
  ~offsetY: float=?,
  // 定位方式属性
  ~start: 'position=?, // array | function
  ~end: 'position=?,
  ~position: 'position=?,
  // Line
  ~text: 'text=?,
  // Text
  ~content: 'content=?,
  ~rotate: float=?,
  // Image
  ~src: string=?,
  // RegionFilter
  ~color: string=?,
  ~apply: array<'geomName>=?,
  // DataMarker
  ~point: 'point=?,
  ~line: 'line=?,
  ~autoAdjust: bool=?,
  ~direction: [#upward | #downward]=?,
  // DataRegion
  ~lineLength: float=?,
  ~region: 'region=?,
  // Html
  ~container: 'container=?,
  ~html: 'html=?,
  ~alignX: [#left | #middle | #right]=?,
  ~offsetX: float=?,
  ~offsetY: float=?,
) => React.element = "Annotation"
