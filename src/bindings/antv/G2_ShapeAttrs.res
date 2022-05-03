type fontWeight
type color = Js.Nullable.t<string>
type lineDash = Js.Nullable.t<array<float>>
type path
type points

type t = {
  "x": option<float>, // x 坐标
  "y": option<float>, // y 坐标
  "r": option<float>, // 半径
  "stroke": option<color>, // 描边颜色
  "strokeOpacity": option<float>, // 描边透明度
  "fill": option<color>, // 填充颜色
  "fillOpacity": option<float>, // 填充透明度
  "opacity": option<float>, // 整体透明度
  "lineWidth": option<float>, // 线宽
  "lineCap": option<[#butt | #round | #square]>, // 线条端点样式
  "lineJoin": option<[#bevel | #round | #miter]>, // 线条如何连接在一起
  "lineDash": option<lineDash>, // 描边的虚线配置，可以指定一个数组。一组描述交替绘制线段和间距（坐标空间单位）长度的数字。 如果数组元素的数量是奇数， 数组的元素会被复制并重复。例如， [5, 15, 25] 会变成 [5, 15, 25, 5, 15, 25]。
  "path": option<path>,
  "points": option<points>,
  "width": option<float>,
  "height": option<float>,
  "shadowBlur": option<float>, // 阴影的高斯模糊系数
  "shadowColor": option<color>, // 阴影颜色
  "shadowOffsetX": option<float>, // 设置阴影距形状的水平距离
  "shadowOffsetY": option<float>, // 设置阴影距形状的垂直距离
  "textAlign": option<[#center | #end | #left | #right | #start]>, // 设置文本内容的当前对齐方式
  "textBaseline": option<[#top | #middle | #bottom | #hanging | #alphabetic | #ideographic]>, // 绘制文本时的基线
  "fontStyle": option<[#normal | #italic | #oblique]>, // 字体样式
  "fontSize": option<int>, // 文字大小
  "fontFamily": option<string>, // 文字字体
  "fontWeight": option<fontWeight>, // 字体粗细
  "fontVariant": option<[#normal | #"small-caps" | #string]>, // 字体变体
  "lineHeight": option<float>, // 行高
}

@obj
external make: (
  ~x: float=?,
  ~y: float=?,
  ~r: float=?,
  ~stroke: color=?,
  ~strokeOpacity: float=?,
  ~fill: color=?,
  ~fillOpacity: float=?,
  ~opacity: float=?,
  ~lineWidth: float=?,
  ~lineCap: [#butt | #round | #square]=?,
  ~lineJoin: [#bevel | #round | #miter]=?,
  ~lineDash: lineDash=?,
  ~path: path=?,
  ~points: points=?,
  ~width: float=?,
  ~height: float=?,
  ~shadowBlur: float=?,
  ~shadowColor: color=?,
  ~shadowOffsetX: float=?,
  ~shadowOffsetY: float=?,
  ~textAlign: [#center | #end | #left | #right | #start]=?,
  ~textBaseline: [#top | #middle | #bottom]=?,
  ~fontStyle: [#normal | #italic | #oblique]=?,
  ~fontSize: int=?,
  ~fontFamily: string=?,
  ~fontWeight: float=?,
  ~fontWeight__name: [#normal| #bold | #bolder | #lighter]=?,
  ~fontVariant: [#normal | #"small-caps" | #string]=?,
  ~lineHeight: float=?,
  unit,
) => t = ""


@obj
external line: (
  ~fill: color=?,
  ~stroke: color=?,
  ~opacity: float=?,
  ~fillOpacity: float=?,
  ~strokeOpacity: float=?,
  ~shadowColor: color=?,
  ~shadowBlur: float=?,
  ~shadowOffsetX: float=?,
  ~shadowOffsetY: float=?,
  ~lineCap: [#butt | #round | #square]=?,
  ~lineJoin: [#bevel | #round | #miter]=?,
  ~lineWidth: float=?,
  ~lineAppendWidth: float=?,
  ~lineDash: array<float>=?,
  unit,
) => t = ""

@obj
external text: (
  ~fill: color=?,
  ~stroke: color,
  ~opacity: float,
  ~fillOpacity: float,
  ~strokeOpacity: float,
  ~shadowColor: color,
  ~shadowBlur: float,
  ~shadowOffsetX: float,
  ~shadowOffsetY: float,
  ~lineCap: string,
  ~lineJoin: [#bevel | #round | #miter],
  ~lineWidth: float,
  ~lineAppendWidth: float,
  ~lineDash: array<float>,
  ~textAlign: [#center | #end | #left | #right | #start],
  ~textBaseline: [#top | #middle | #bottom],
  ~fontWeight: float=?,
  ~fontWeight__name: [#normal| #bold | #bolder | #lighter]=?,
  ~fontSize: int,
  ~fontFamily: string,
  unit,
) => t = ""
