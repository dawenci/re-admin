module AnnotationOption = {
  type componentAnimateCfg = {"duration": option<int>, "easing": option<string>, "delay": option<int>} // 动画执行时间 // 动画缓动函数 // 动画延迟时间
  type componentAnimateOption = {
    "appear": option<componentAnimateCfg>,
    "enter": option<componentAnimateCfg>,
    "update": option<componentAnimateCfg>,
    "leave": option<componentAnimateCfg>,
  }

  type content
  external content: 'a => content = "%identity"

  type annotationPosition
  external annotationPosition: 'a => annotationPosition = "%identity"

  type padding
  external padding: 'a => padding = "%identity"

  type enhancedTextBackgroundCfg = {
    "padding": option<padding>,
    "style": option<G2_ShapeAttrs.t>,
  }

  type point
  external point: 'a => point = "%identity"

  module Line = {
    type t
    external line: 'a => t = "%identity"
  }

  module Region = {
    type t
    external region: 'a => t = "%identity"
  }

  type render // ( container: IGroup, view: View, helpers: { parsePosition: (position: [string | number, string | number] | Datum) => Point } ) => void
  external render: 'a => render = "%identity"

  type container
  external container: 'a => container = "%identity"

  module Html = {
    type t
    external html: 'a => t = "%identity"
  }

  @deriving(abstract)
  type t = {
    @optional top: bool,
    @optional animate: bool,
    @optional animateOption: componentAnimateOption,
    @optional offsetX: float,
    @optional offsetY: float,
    @optional start: annotationPosition,
    @optional end: annotationPosition,
    @optional style: G2_ShapeAttrs.t,
    @optional src: string,
    @optional text: string,
    @optional content: content,
    @optional rotate: float,
    @optional position: annotationPosition,
    @optional background: enhancedTextBackgroundCfg,
    @optional maxLength: float,
    @optional autoEllipsis: bool,
    @optional isVertical: bool,
    @optional ellipsisPosition: [#head | #middle | #tail],
    @optional color: string,
    @optional apply: array<string>,
    @optional point: point,
    @optional line: Line.t,
    @optional autoAdjust: bool,
    @optional direction: [#upward | #downward],
    @optional lineLength: float,
    @optional region: Region.t,
    @optional render: render,
    @optional container: container,
    @optional html: Html.t,
    @optional alignX: float,
    @optional alignY: float,
  }
}

module AnnotationController = {
  type t

  @send external arc: (t, AnnotationOption.t) => t = "arc"
  @send external image: (t, AnnotationOption.t) => t = "image"
  @send external line: (t, AnnotationOption.t) => t = "line"
  @send external text: (t, AnnotationOption.t) => t = "text"
  @send external region: (t, AnnotationOption.t) => t = "region"
  @send external regionFilter: (t, AnnotationOption.t) => t = "regionFilter"
  @send external dataMarker: (t, AnnotationOption.t) => t = "dataMarker"
  @send external dataRegion: (t, AnnotationOption.t) => t = "dataRegion"
  @send external shape: (t, AnnotationOption.t) => t = "shape"
  @send external html: (t, AnnotationOption.t) => t = "html"
}
