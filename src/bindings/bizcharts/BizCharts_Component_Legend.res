type shapeAttrs = G2_ShapeAttrs.t
type track = {"style": option<shapeAttrs>}
@obj external track: (~style: shapeAttrs=?, unit) => track = ""
type rail = {
  "type": option<[#color | #size]>, // rail 的类型，color, size
  "size": option<float>, // 滑轨的宽度
  "defaultLength": option<float>, // 滑轨的默认长度，，当限制了 maxWidth,maxHeight 时，不会使用这个属性会自动计算长度
  "style": option<shapeAttrs>, // 滑轨的样式
}
@obj
external rail: (
  ~_type: [#color | #size]=?,
  ~size: float=?,
  ~defaultLength: float=?,
  ~style: shapeAttrs=?,
  unit,
) => rail = ""

type title = {
  // 文本同滑轨的对齐方式，有五种类型
  // rail ： 同滑轨对齐，在滑轨的两端
  // top, bottom: 图例水平布局时有效
  // left, right: 图例垂直布局时有效
  "align": option<string>,
  "spacing": option<float>, // 文本同滑轨的距离
  "style": option<shapeAttrs>, // 文本样式
}
@obj external title: (
  ~align: string=?,
  ~spacing: float=?,
  ~style: shapeAttrs=?,
  unit
) => title= ""

type legendItem<'value, 'markerCfg> = {
  /** 唯一值，用于动画或者查找 */
  "id": option<string>,
  /** 名称 */
  "name": string,
  /** 值 */
  "value": 'value,
  /** 图形标记 */
  "marker": option<'markerCfg>,
  /** 初始是否处于未激活状态 */
  "unchecked": option<bool>,
}
@obj external legendItem: (
  ~id: string=?,
  ~name: string,
  ~value: 'value,
  ~marker: 'markerCfg=?,
  ~unchecked: bool=?,
  unit
) => legendItem<'value, 'markerCfg> = ""

@module("bizcharts") @react.component
external make: (
  ~name: string=?,
  ~visible: bool=?,
  ~position: [
    | #left
    | #"left-top"
    | #"left-bottom"
    | #right
    | #"right-top"
    | #"right-bottom"
    | #top
    | #"top-left"
    | #"top-right"
    | #bottom
    | #"bottom-left"
    | #"bottom-right"
  ]=?,
  ~offsetX: float=?,
  ~offsetY: float=?,
  ~layout: [#horizontal | #vertical]=?,
  ~title: title=?,
  ~background: 'background=?,
  ~filter: ('value, 'datum, int) => bool=?,
  ~onChange: (BizCharts_Event.t, G2.Chart.t) => unit=?,
  // 连续图例专用
  ~slidable: bool=?,
  ~min: float=?,
  ~max: float=?,
  ~value: float=?,
  ~track: track=?,
  ~rail: rail=?,
  ~handler: 'handler=?,
  // 分类图例专用
  ~custom: bool=?,
  ~items: array<legendItem<'a, 'b>>=?,
  ~itemStates: 'itemStates=?,
  ~itemSpacing: float=?,
  ~maxItemWidth: float=?,
  ~itemWidth: float=?,
  ~itemHeight: float=?,
  ~itemValue: 'itemValue=?,
  ~itemName: 'itemName=?,
  ~maxWidth: float=?,
  ~maxHeight: float=?,
  ~marker: 'marker=?,
  ~flipPage: bool=?,
  ~pageNavigator: 'pageNavigator=?,
  ~reversed: bool=?,
) => React.element = "Legend"
