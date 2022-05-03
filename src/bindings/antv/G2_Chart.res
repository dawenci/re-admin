module ChartCfg = {
  type t
  @obj
  external make: (
    ~container: 'idOrDom=?,
    ~autoFit: bool=?,
    ~width: float=?,
    ~height: float=?,
    ~padding: 'padding=?,
    ~appendPadding: 'padding=?,
    ~defaultInteractions: 'defaultInteractions=?,
    ~limitInPlot: bool=?,
    ~pixelRatio: float=?,
    ~renderer: [#canvas | #svg]=?,
    ~theme: 'theme=?,
    ~visible: bool=?,
    unit,
  ) => t = ""
}

type t

@module("@antv/g2") @new external make: ChartCfg.t => t = "Chart"

// chart api
@send external forceFit: t => unit = "forceFit"
@send external changeSize: (t, float, float) => t = "changeSize"
@send external changeVisible: (t, bool) => t = "changeVisible"

// view api
@send external animate: (t, bool) => t = "animate"
@send external data: (t, 'data) => t = "data"
@send external changeData: (t, 'data) => unit = "changeData"
@send external getData: t => 'data = "getData"
@send external filter: (t, string, 'condition) => t = "filter"
@send external filterData: (t, 'data) => 'data = "filterData"
@send external filterFieldData: (t, string, 'data) => 'data = "filterFieldData"

@send external scaleFieldOption: (t, string, G2_Scale.ScaleOption.t) => t = "scale"
@send external scaleFieldsOption: (t, Js.Dict.t<G2_Scale.ScaleOption.t>) => t = "scale"
@send external scaleFirldsOption2: (t, Js.Dict.t<G2_Scale.ScaleOption.t>, G2_Scale.ScaleOption.t) => t = "scale"

@send external getXScale: t => 'scale = "getXScale"
@send external getYScales: t => array<'scale> = "getYScales"
@send external getGroupScales: t => array<'scale> = "getGroupScales"
@send external getXY: (t, 'datum) => 'point = "getXY"

@send
external getController: (
  t,
  [> #tooltip | #axis | #legend | #scrollbar | #slider | #annotation | #gestucre],
) => 'controller = "getController"
@send
external getTooltipController: (t, [#tooltip]) => G2_Tooltip.TooltipController.t = "getController"
@send external getAxisController: (t, [#axis]) => G2_Axis.AxisController.t = "getController"
@send external getLegendController: (t, [#legend]) => G2_Legend.LegendController.t = "getController"
@send
external getScrollbarController: (t, [#scrollbar]) => G2_Scrollbar.ScrollbarController.t =
  "getController"
@send external getSliderController: (t, [#slider]) => G2_Slider.SliderController.t = "getController"
@send
external getAnnotationController: (t, [#annotation]) => G2_Annotation.AnnotationController.t =
  "getController"
@send
external getGestucreController: (t, [#gestucre]) => G2_Gestucre.GestucreController.t =
  "getController"

@send
external coordinateOption: (
  t,
  G2_Coordinate.CoordinateOption.t,
) => G2_Coordinate.CoordinateController.t = "coordinate"
@send
external coordinateTypeConfig: (
  t,
  [>],
  G2_Coordinate.CoordinateCfg.t,
) => G2_Coordinate.CoordinateController.t = "coordinate"
@send
external coordinateOptionConfig: (
  t,
  G2_Coordinate.CoordinateOption.t,
  G2_Coordinate.CoordinateCfg.t,
) => G2_Coordinate.CoordinateController.t = "coordinate"

@send external getCoordinate: t => G2_Coordinate.Coordinate.t = "getCoordinate"

@send external axisToggle: (t, bool) => t = "axis"
@send external axisFieldToggle: (t, string, bool) => t = "axis"
@send external axisFieldOption: (t, string, G2_Axis.AxisOption.t) => t = "axis"

@send external legendToggle: (t, bool) => t = "legend"
@send external legendFieldToggle: (t, string, bool) => t = "legend"
@send external legendFieldOption: (t, string, 'legendOption) => t = "legend"

@send external tooltipToggle: (t, bool) => t = "tooltip"
@send external tooltipOption: (t, 'tooltipOption) => t = "tooltip"

@send external showTooltip: (t, 'point) => t = "showTooltip"
@send external hideTooltip: t => t = "hideTooltip"
@send external lockTooltip: t => t = "lockTooltip"
@send external unlockTooltip: t => t = "unlockTooltip"

@send external annotation: t => G2_Annotation.AnnotationController.t = "annotation"

@send external option: (t, [#slider | #scrollbar], bool) => t = "option"
@send external sliderOption: (t, [#slider], G2_Slider.SliderCfg.t) => t = "option"
@send external scrollbarOption: (t, [#scrollbar], G2_Scrollbar.ScrollbarCfg.t) => t = "option"

@send external facet: (t, G2_Facet.facetType, G2_Facet.FacetCfg.t<'d>) => t = "facet"

@send external interaction: (t, string, 'cfg) => t = "interaction"
@send external removeInteraction: (t, string) => t = "removeInteraction"

@send external on: (t, string, G2_Event.Event.t => unit) => t = "on"
@send external once: (t, string, G2_Event.Event.t => unit) => t = "once"
@send external off: (t, string, G2_Event.Event.t => unit) => t = "off"

@send external theme: t => unit = "theme"
@send external getTheme: t => 'looseObject = "getTheme"

// 生命周期 api
@send external render: (t, bool) => unit = "render"
@send external clear: t => unit = "clear"
@send external destroy: t => unit = "destroy"

// view 管理 api
@send external createViewDefault: t => t = "createView"
@send external createView: (t, 'cfg) => t = "createView"
@send external removeView: (t, 'view) => t = "removeView"

// 创建几何图形
@send external area: (t, 'options) => G2_Geometry.t = "area"
@send external edge: (t, 'options) => G2_Geometry.t = "edge"
@send external heatmap: (t, 'options) => G2_Geometry.t = "heatmap"
@send external interval: (t, 'options) => G2_Geometry.t = "interval"
@send external line: (t, 'options) => G2_Geometry.t = "line"
@send external path: (t, 'options) => G2_Geometry.t = "path"
@send external point: (t, 'options) => G2_Geometry.t = "point"
@send external polygon: (t, 'options) => G2_Geometry.t = "polygon"
@send external schema: (t, 'options) => G2_Geometry.t = "schema"
@send external violin: (t, 'options) => G2_Geometry.t = "violin"
