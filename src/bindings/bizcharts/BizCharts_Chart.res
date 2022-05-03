type padding
external autoPadding: [#auto] => padding = "%identity"
external numPadding: float => padding = "%identity"
external arrPadding: array<float> => padding = "%identity"

type filter
external arrFilter: array<(string, 'value => bool)> => filter = "%identity"
external objFilter: Js.Dict.t<'value => bool> => filter = "%identity"

type lifecycleEvent = (BizCharts_Event.t, G2.Chart.t) => unit

type props
@obj external makeProps_: (
  ~data: array<'data>,
  ~autoFit: bool=?,
  ~width: float=?,
  ~height: float=?,
  // "auto" | float | array<float>
  ~padding: padding=?,
  ~appendPadding: padding=?,
  ~forceUpdate: bool=?,
  ~pixelRatio: float=?,
  ~pure: bool=?,
  ~errorContent: React.element=?,
  ~placeholder: React.element=?,
  ~defaultInteractions: array<G2_Interaction.actionName>=?,
  ~animate: bool=?,
  ~interactions: array<G2_Interaction.actionName>=?,
  ~filter: filter=?,
  ~onGetG2Instance: G2.Chart.t => unit=?,
  ~notCompareData: bool=?,
  ~scale: Js.Dict.t<G2_Scale.ScaleOption.t>=?,

  // 生命周期的事件
  ~onBeforerender: lifecycleEvent=?,
  ~onAfterrender: lifecycleEvent=?,
  ~onBeforepaint: lifecycleEvent=?,
  ~onAfterpaint: lifecycleEvent=?,
  ~onBeforechangedata: lifecycleEvent=?,
  ~onAfterchangedata: lifecycleEvent=?,
  ~onBeforeclear: lifecycleEvent=?,
  ~onAfterclear: lifecycleEvent=?,
  ~onBeforedestroy: lifecycleEvent=?,
  // 图表坐标系区域内的事件，不包括Axis padding等留白区域
  ~onPlotMousedown: lifecycleEvent=?,
  ~onPlotMouseup: lifecycleEvent=?,
  ~onPlotDblclick: lifecycleEvent=?,
  ~onPlotMouseenter: lifecycleEvent=?,
  ~onPlotMouseout: lifecycleEvent=?,
  ~onPlotMouseover: lifecycleEvent=?,
  ~onPlotMousemove: lifecycleEvent=?,
  ~onPlotMouseleave: lifecycleEvent=?,
  ~onPlotContextmenu: lifecycleEvent=?,
  ~onPlotClick: lifecycleEvent=?,
  // 鼠标
  ~onMousedown: lifecycleEvent=?,
  ~onMouseup: lifecycleEvent=?,
  ~onDblclick: lifecycleEvent=?,
  ~onMouseenter: lifecycleEvent=?,
  ~onMouseout: lifecycleEvent=?,
  ~onMouseover: lifecycleEvent=?,
  ~onMousemove: lifecycleEvent=?,
  ~onMouseleave: lifecycleEvent=?,
  ~onContextmenu: lifecycleEvent=?,
  ~onClick: lifecycleEvent=?,
  ~onTooltipChange: lifecycleEvent=?,
  // 移动端
  ~onTouchstart: lifecycleEvent=?,
  ~onTouchmove: lifecycleEvent=?,
  ~onTouchend: lifecycleEvent=?,
  ~onTouchcancel: lifecycleEvent=?,
  // 
  ~\"onAxisLabel$Mousedown": lifecycleEvent=?,
  ~\"onAxisLabel$Mouseup": lifecycleEvent=?,
  ~\"onAxisLabel$Dblclick": lifecycleEvent=?,
  ~\"onAxisLabel$Mouseenter": lifecycleEvent=?,
  ~\"onAxisLabel$Mouseout": lifecycleEvent=?,
  ~\"onAxisLabel$Mouseover": lifecycleEvent=?,
  ~\"onAxisLabel$Mousemove": lifecycleEvent=?,
  ~\"onAxisLabel$Mouseleave": lifecycleEvent=?,
  ~\"onAxisLabel$Contextmenu": lifecycleEvent=?,
  ~\"onAxisLabel$Click": lifecycleEvent=?,
  ~\"onAxisLabel$TooltipChange": lifecycleEvent=?,

  ~children: React.element=?,
  unit
) => props = ""

let makeProps = (
  ~data: array<'data>,
  ~autoFit: option<bool>=?,
  ~width: option<float>=?,
  ~height: option<float>=?,
  // "auto" | float | array<float>
  ~padding: option<[#auto|#float(float)|#array(array<float>)]>=?,
  ~appendPadding: option<padding>=?,
  ~forceUpdate: option<bool>=?,
  ~pixelRatio: option<float>=?,
  ~pure: option<bool>=?,
  ~errorContent: option<React.element>=?,
  ~placeholder: option<React.element>=?,
  ~defaultInteractions: option<array<G2_Interaction.actionName>>=?,
  ~animate: option<bool>=?,
  ~interactions: option<array<G2_Interaction.actionName>>=?,
  ~filter: option<filter>=?,
  ~onGetG2Instance: option<G2.Chart.t => unit>=?,
  ~notCompareData: option<bool>=?,
  ~scale: option<Js.Dict.t<G2_Scale.ScaleOption.t>>=?,

  // 生命周期的事件
  ~onBeforerender: option<lifecycleEvent>=?,
  ~onAfterrender: option<lifecycleEvent>=?,
  ~onBeforepaint: option<lifecycleEvent>=?,
  ~onAfterpaint: option<lifecycleEvent>=?,
  ~onBeforechangedata: option<lifecycleEvent>=?,
  ~onAfterchangedata: option<lifecycleEvent>=?,
  ~onBeforeclear: option<lifecycleEvent>=?,
  ~onAfterclear: option<lifecycleEvent>=?,
  ~onBeforedestroy: option<lifecycleEvent>=?,
  // 图表坐标系区域内的事件，不包括Axis padding等留白区域
  ~onPlotMousedown: option<lifecycleEvent>=?,
  ~onPlotMouseup: option<lifecycleEvent>=?,
  ~onPlotDblclick: option<lifecycleEvent>=?,
  ~onPlotMouseenter: option<lifecycleEvent>=?,
  ~onPlotMouseout: option<lifecycleEvent>=?,
  ~onPlotMouseover: option<lifecycleEvent>=?,
  ~onPlotMousemove: option<lifecycleEvent>=?,
  ~onPlotMouseleave: option<lifecycleEvent>=?,
  ~onPlotContextmenu: option<lifecycleEvent>=?,
  ~onPlotClick: option<lifecycleEvent>=?,
  // 鼠标
  ~onMousedown: option<lifecycleEvent>=?,
  ~onMouseup: option<lifecycleEvent>=?,
  ~onDblclick: option<lifecycleEvent>=?,
  ~onMouseenter: option<lifecycleEvent>=?,
  ~onMouseout: option<lifecycleEvent>=?,
  ~onMouseover: option<lifecycleEvent>=?,
  ~onMousemove: option<lifecycleEvent>=?,
  ~onMouseleave: option<lifecycleEvent>=?,
  ~onContextmenu: option<lifecycleEvent>=?,
  ~onClick: option<lifecycleEvent>=?,
  ~onTooltipChange: option<lifecycleEvent>=?,
  // 移动端
  ~onTouchstart: option<lifecycleEvent>=?,
  ~onTouchmove: option<lifecycleEvent>=?,
  ~onTouchend: option<lifecycleEvent>=?,
  ~onTouchcancel: option<lifecycleEvent>=?,
  // 
  // ~\"onAxisLabel$Mousedown": option<lifecycleEvent>=?,
  // ~\"onAxisLabel$Mouseup": option<lifecycleEvent>=?,
  // ~\"onAxisLabel$Dblclick": option<lifecycleEvent>=?,
  // ~\"onAxisLabel$Mouseenter": option<lifecycleEvent>=?,
  // ~\"onAxisLabel$Mouseout": option<lifecycleEvent>=?,
  // ~\"onAxisLabel$Mouseover": option<lifecycleEvent>=?,
  // ~\"onAxisLabel$Mousemove": option<lifecycleEvent>=?,
  // ~\"onAxisLabel$Mouseleave": option<lifecycleEvent>=?,
  // ~\"onAxisLabel$Contextmenu": option<lifecycleEvent>=?,
  // ~\"onAxisLabel$Click": option<lifecycleEvent>=?,
  // ~\"onAxisLabel$TooltipChange": option<lifecycleEvent>=?,

  ~children: option<React.element>=?,
  ()
) => {
  makeProps_(
    ~data=data,
    ~autoFit=?autoFit,
    ~width=?width,
    ~height=?height,
    // "auto" | float | array<float>
    ~padding=?switch padding {
    | Some(#auto) => Some(autoPadding(#auto))
    | Some(#float(value)) => Some(numPadding(value))
    | Some(#array(values)) => Some(arrPadding(values))
    | None => None
    },
    ~appendPadding=?appendPadding,
    ~forceUpdate=?forceUpdate,
    ~pixelRatio=?pixelRatio,
    ~pure=?pure,
    ~errorContent=?errorContent,
    ~placeholder=?placeholder,
    ~defaultInteractions=?defaultInteractions,
    ~animate=?animate,
    ~interactions=?interactions,
    ~filter=?filter,
    ~onGetG2Instance=?onGetG2Instance,
    ~notCompareData=?notCompareData,
    ~scale=?scale,

    // 生命周期的事件
    ~onBeforerender=?onBeforerender,
    ~onAfterrender=?onAfterrender,
    ~onBeforepaint=?onBeforepaint,
    ~onAfterpaint=?onAfterpaint,
    ~onBeforechangedata=?onBeforechangedata,
    ~onAfterchangedata=?onAfterchangedata,
    ~onBeforeclear=?onBeforeclear,
    ~onAfterclear=?onAfterclear,
    ~onBeforedestroy=?onBeforedestroy,
    // 图表坐标系区域内的事件，不包括Axis padding等留白区域
    ~onPlotMousedown=?onPlotMousedown,
    ~onPlotMouseup=?onPlotMouseup,
    ~onPlotDblclick=?onPlotDblclick,
    ~onPlotMouseenter=?onPlotMouseenter,
    ~onPlotMouseout=?onPlotMouseout,
    ~onPlotMouseover=?onPlotMouseover,
    ~onPlotMousemove=?onPlotMousemove,
    ~onPlotMouseleave=?onPlotMouseleave,
    ~onPlotContextmenu=?onPlotContextmenu,
    ~onPlotClick=?onPlotClick,
    // 鼠标
    ~onMousedown=?onMousedown,
    ~onMouseup=?onMouseup,
    ~onDblclick=?onDblclick,
    ~onMouseenter=?onMouseenter,
    ~onMouseout=?onMouseout,
    ~onMouseover=?onMouseover,
    ~onMousemove=?onMousemove,
    ~onMouseleave=?onMouseleave,
    ~onContextmenu=?onContextmenu,
    ~onClick=?onClick,
    ~onTooltipChange=?onTooltipChange,
    // 移动端
    ~onTouchstart=?onTouchstart,
    ~onTouchmove=?onTouchmove,
    ~onTouchend=?onTouchend,
    ~onTouchcancel=?onTouchcancel,
    ~children=?children,
    ())
}

@module("bizcharts")
external make: React.component<props> = "Chart"
