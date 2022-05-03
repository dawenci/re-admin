module Legend = {}
module Axis = {}

type graphicStyle = {
  "fill": string, // 图形的填充色
  "fillOpacity": float, // 图形的填充透明度
  "stroke": string, // 图形的描边
  "lineWidth": float, // 图形描边的宽度
  "lineDash": (float, float), // 描边的虚线配置，第一个值为虚线每个分段的长度，第二个值为分段间隔的距离。lineDash 设为[0,0]的效果为没有描边。
  "lineOpacity": float, // 描边透明度
  "opacity": float, // 图形的整体透明度
  "shadowColor": string, // 图形阴影颜色
  "shadowBlur": float, // 图形阴影的高斯模糊系数
  "shadowOffsetX": float, // 设置阴影距图形的水平距离
  "shadowOffsetY": float, // 设置阴影距图形的垂直距离
  "cursor": string, // 鼠标样式。同 css 的鼠标样式，默认 'default'。
}
@obj
external makeGraphicStyle: (
  ~fill: string=?,
  ~fillOpacity: float=?,
  ~stroke: string=?,
  ~lineWidth: float=?,
  ~lineDash: (float, float)=?,
  ~lineOpacity: float=?,
  ~opacity: float=?,
  ~shadowColor: string=?,
  ~shadowBlur: float=?,
  ~shadowOffsetX: float=?,
  ~shadowOffsetY: float=?,
  ~cursor: string=?,
  unit,
) => graphicStyle = ""

type lineStyle = {
  "stroke": string, // 线的颜色
  "lineWidth": float, // 线宽
  "lineDash": (float, float), // 虚线配置，第一个值为虚线每个分段的长度，第二个值为分段间隔的距离。lineDash 设为[0,0]的效果为没有描边。
  "opacity": float, // 透明度
  "shadowColor": string, // 阴影颜色
  "shadowBlur": float, // 高斯模糊系数
  "shadowOffsetX": float, // 设置阴影距图形的水平距离
  "shadowOffsetY": float, // 设置阴影距图形的垂直距离
  "cursor": string, // 鼠标样式。同 css 的鼠标样式,默认 'default'。
}
@obj
external makeLineStyle: (
  ~stroke: string=?,
  ~lineWidth: float=?,
  ~lineDash: (float, float)=?,
  ~opacity: float=?,
  ~shadowColor: string=?,
  ~shadowBlur: float=?,
  ~shadowOffsetX: float=?,
  ~shadowOffsetY: float=?,
  ~cursor: string=?,
  unit,
) => lineStyle = ""

type textStyle = {
  "fontSize": float, // 文字大小
  "fontFamily": string, // 文字字体
  "fontWeight": float, // 字体粗细
  "lineHeight": float, // 文字的行高
  "textAlign": string, // 设置文本内容的当前对齐方式, 支持的属性：center | end | left | right | start，默认值为start
  "textBaseline": string, // 设置在绘制文本时使用的当前文本基线, 支持的属性:top | middle | bottom | alphabetic | hanging。默认值为bottom
  "fill": string, // 文字的填充色
  "fillOpacity": float, // 文字的填充透明度
  "stroke": string, // 文字的描边
  "lineWidth": float, // 文字描边的宽度
  "lineDash": (float, float), // 描边的虚线配置，第一个值为虚线每个分段的长度，第二个值为分段间隔的距离。lineDash 设为[0,0]的效果为没有描边。
  "lineOpacity": float, // 描边透明度
  "opacity": float, // 文字的整体透明度
  "shadowColor": string, // 文字阴影颜色
  "shadowBlur": float, // 文字阴影的高斯模糊系数
  "shadowOffsetX": float, // 设置阴影距文字的水平距离
  "shadowOffsetY": float, // 设置阴影距文字的垂直距离
  "cursor": string, // 鼠标样式。同 css 的鼠标样式,默认 'default'。
}
@obj
external makeTextStyle: (
  ~fontSize: float,
  ~fontFamily: string,
  ~fontWeight: float,
  ~lineHeight: float,
  ~textAlign: string,
  ~textBaseline: string,
  ~fill: string,
  ~fillOpacity: float,
  ~stroke: string,
  ~lineWidth: float,
  ~lineDash: (float, float),
  ~lineOpacity: float,
  ~opacity: float,
  ~shadowColor: string,
  ~shadowBlur: float,
  ~shadowOffsetX: float,
  ~shadowOffsetY: float,
  ~cursor: string,
  unit,
) => textStyle = ""

module LineChart = {
  type pointStyle = {"fill": option<string>}
  @obj
  external makePointStyle: (
    ~fill: string=?,
    ~stroke: string=?,
    ~lineWidth: string=?,
    ~lineDash: float=?,
    ~opacity: float=?,
    ~fillOpacity: float=?,
    ~strokeOpacity: float=?,
    unit,
  ) => pointStyle = ""

  type point = {
    "visible": option<bool>,
    "shape": option<string>,
    "size": option<float>,
    "style": option<pointStyle>,
  }
  @obj
  external makePoint: (
    ~visible: bool=?,
    ~shape: string=?,
    ~size: float=?,
    ~style: pointStyle=?,
    unit,
  ) => point = ""

  @module("bizcharts") @react.component
  external make: (
    // 图表容器
    ~width: float=?,
    ~height: float=?,
    ~autoFit: bool=?,
    ~pixelRatio: float=?,
    ~renderer: [#canvas | #svg]=?,
    // 数据映射
    ~data: array<'data>,
    ~meta: 'meta=?,
    ~xField: string,
    ~yField: string,
    ~seriesField: string=?,
    // 图形样式
    ~color: 'color=?,
    ~lineSize: float=?,
    ~lineStyle: lineStyle=?,
    ~smooth: bool=?,
    ~point: point=?,
    // 图表组件
    ~title: 'title=?,
    ~description: 'description=?,
    ~xAxis: 'xaxis=?,
    ~yAxis: 'yaxis=?,
    ~legend: 'legend=?,
    ~tooltip: 'tooltip=?,
    ~label: 'label=?,
    ~guideLine: 'guideline=?,
    // 事件
    ~events: 'events=?,
  ) => React.element = "LineChart"
}

module StepLineChart = {
  type pointStyle = {"fill": option<string>}
  @obj
  external makePointStyle: (
    ~fill: string=?,
    ~stroke: string=?,
    ~lineWidth: string=?,
    ~lineDash: float=?,
    ~opacity: float=?,
    ~fillOpacity: float=?,
    ~strokeOpacity: float=?,
    unit,
  ) => pointStyle = ""

  type point = {
    "visible": option<bool>,
    "shape": option<string>,
    "size": option<float>,
    "style": option<pointStyle>,
  }
  @obj
  external makePoint: (
    ~visible: bool=?,
    ~shape: string=?,
    ~size: float=?,
    ~style: pointStyle=?,
    unit,
  ) => point = ""

  @module("bizcharts") @react.component
  external make: (
    // 图表容器
    ~width: float=?,
    ~height: float=?,
    ~autoFit: bool=?,
    ~pixelRatio: float=?,
    ~renderer: [#canvas | #svg]=?,
    // 数据映射
    ~data: array<'data>,
    ~meta: 'meta=?,
    ~xField: string,
    ~yField: string,
    ~seriesField: string=?,
    ~step: [#hv | #vh | #vhv | #hvh]=?,
    // 图形样式
    ~color: 'color=?,
    ~lineSize: float=?,
    ~lineStyle: lineStyle=?,
    ~smooth: bool=?,
    ~point: point=?,
    // 图表组件
    ~title: 'title=?,
    ~description: 'description=?,
    ~xAxis: 'xaxis=?,
    ~yAxis: 'yaxis=?,
    ~legend: 'legend=?,
    ~tooltip: 'tooltip=?,
    ~label: 'label=?,
    ~guideLine: 'guideline=?,
    // 事件
    ~events: 'events=?,
  ) => React.element = "StepLineChart"
}

module AreaChart = {
  type areaStyle = {
    "fill": option<string>,
    "stroke": option<string>,
    "lineWidth": option<float>,
    "lineDash": option<float>,
    "opacity": option<float>,
    "fillOpacity": option<float>,
    "strokeOpacity": option<float>,
  }
  @obj
  external makeAreaStyle: (
    ~fill: string=?,
    ~stroke: string=?,
    ~lineWidth: float=?,
    ~lineDash: float=?,
    ~opacity: float=?,
    ~fillOpacity: float=?,
    ~strokeOpacity: float=?,
    unit,
  ) => areaStyle = ""

  type line = {"visible": bool, "size": float, "style": lineStyle}
  @obj external makeLine: (~visible: bool=?, ~size: float=?, ~style: lineStyle=?, unit) => line = ""

  type pointStyle = {"fill": option<string>}
  @obj
  external makePointStyle: (
    ~fill: string=?,
    ~stroke: string=?,
    ~lineWidth: string=?,
    ~lineDash: float=?,
    ~opacity: float=?,
    ~fillOpacity: float=?,
    ~strokeOpacity: float=?,
    unit,
  ) => pointStyle = ""

  type point = {
    "visible": option<bool>,
    "shape": option<string>,
    "size": option<float>,
    "style": option<pointStyle>,
  }
  @obj
  external makePoint: (
    ~visible: bool=?,
    ~shape: string=?,
    ~size: float=?,
    ~style: pointStyle=?,
    unit,
  ) => point = ""

  @module("bizcharts") @react.component
  external make: (
    // 图表容器
    ~width: float=?,
    ~height: float=?,
    ~autoFit: bool=?,
    ~pixelRatio: float=?,
    ~renderer: [#canvas | #svg]=?,
    // 数据映射
    ~data: array<'data>,
    ~meta: 'meta=?,
    ~xField: string,
    ~yField: string,
    ~seriesField: string=?,
    // 图形样式
    ~color: 'color=?,
    ~areaStyle: areaStyle=?,
    ~line: line,
    ~smooth: bool=?,
    ~point: point=?,
    // 图表组件
    ~title: 'title=?,
    ~description: 'description=?,
    ~xAxis: 'xaxis=?,
    ~yAxis: 'yaxis=?,
    ~legend: 'legend=?,
    ~tooltip: 'tooltip=?,
    ~label: 'label=?,
    ~guideLine: 'guideline=?,
    // 事件
    ~events: 'events=?,
  ) => React.element = "AreaChart"
}

module StackedAreaChart = {
  type areaStyle = AreaChart.areaStyle
  let makeAreaStyle = AreaChart.makeAreaStyle

  type line = {"visible": bool, "size": float, "style": lineStyle}
  @obj external makeLine: (~visible: bool=?, ~size: float=?, ~style: lineStyle=?, unit) => line = ""

  type pointStyle = {"fill": option<string>}
  @obj
  external makePointStyle: (
    ~fill: string=?,
    ~stroke: string=?,
    ~lineWidth: string=?,
    ~lineDash: float=?,
    ~opacity: float=?,
    ~fillOpacity: float=?,
    ~strokeOpacity: float=?,
    unit,
  ) => pointStyle = ""

  type point = {
    "visible": option<bool>,
    "shape": option<string>,
    "size": option<float>,
    "style": option<pointStyle>,
  }
  @obj
  external makePoint: (
    ~visible: bool=?,
    ~shape: string=?,
    ~size: float=?,
    ~style: pointStyle=?,
    unit,
  ) => point = ""

  @module("bizcharts") @react.component
  external make: (
    // 图表容器
    ~width: float=?,
    ~height: float=?,
    ~autoFit: bool=?,
    ~pixelRatio: float=?,
    ~renderer: [#canvas | #svg]=?,
    // 数据映射
    ~data: array<'data>,
    ~meta: 'meta=?,
    ~xField: string,
    ~yField: string,
    ~stackField: string=?,
    ~isStack: bool=?,
    ~responsive: bool=?,
    // 图形样式
    ~color: 'color=?,
    ~line: float=?,
    ~areaStyle: areaStyle=?,
    ~smooth: bool=?,
    ~point: point=?,
    // 图表组件
    ~title: 'title=?,
    ~description: 'description=?,
    ~xAxis: 'xaxis=?,
    ~yAxis: 'yaxis=?,
    ~legend: 'legend=?,
    ~tooltip: 'tooltip=?,
    ~label: 'label=?,
    ~guideLine: 'guideline=?,

    // 事件
    ~events: 'events=?,
  ) => React.element = "StackedAreaChart"
}

module ColumnChart = {}

module StackedColumnChart = {}

module GroupedColumnChart = {}

module RangeColumnChart = {}

module HistogramChart = {}

module WaterfallChart = {}

module BarChart = {}

module StackedBarChart = {}

module GroupedBarChart = {}

module RangeBarChart = {}

module PieChart = {
  type pieStyle = {
    "fill": option<string>,
    "stroke": option<string>,
    "lineWidth": option<float>,
    "lineDash": option<float>,
    "opacity": option<float>,
    "fillOpacity": option<float>,
    "strokeOpacity": option<float>,
  }
  @obj
  external makePieStyle: (
    ~fill: string=?,
    ~stroke: string=?,
    ~lineWidth: float=?,
    ~lineDash: float=?,
    ~opacity: float=?,
    ~fillOpacity: float=?,
    ~strokeOpacity: float=?,
    unit,
  ) => pieStyle = ""

  @module("bizcharts") @react.component
  external make: (
    // 图表容器
    ~width: float=?,
    ~height: float=?,
    ~forceFit: bool=?,
    ~pixelRatio: float=?,
    ~renderer: [#canvas | #svg]=?,
    // 数据映射
    ~data: array<'data>,
    ~meta: 'meta=?,
    ~angleField: string,
    ~colorField: string=?,
    // 图形样式
    ~radius: float=?,
    ~color: 'color=?,
    ~pieStyle: pieStyle=?,
    // 图表组件
    ~title: 'title=?,
    ~description: 'description=?,
    ~legend: 'legend=?,
    ~tooltip: 'tooltip=?,
    ~label: 'label=?,
    // 事件
    ~events: 'events=?,
  ) => React.element = "PieChart"
}

module DonutChart = {}

module RoseChart = {}
module StackedRoseChart = {}
module GroupedRoseChart = {}
module RadarChart = {}
module ScatterChart = {}
module BubbleChart = {}

module HeatmapChart = {}

module DensityHeatmapChart = {}
module TreemapChart = {}
module CalendarChart = {}
module BulletChart = {}
module GaugeChart = {
  @module("bizcharts") @react.component
  external make: (
    // 图表容器
    ~width: float=?,
    ~height: float=?,
    ~autoFit: bool=?,
    ~pixelRatio: float=?,
    ~renderer: [#canvas | #svg]=?,
    ~padding: 'padding=?,
    ~appendPadding: 'b=?,
    ~limitInPlot: bool=?,
    // 数据映射
    ~percent: float,
    ~radius: float=?,
    ~innerRadius: float=?,
    ~startAngle: float=?,
    ~endAngle: float=?,
    // 图形样式
    ~range: 'range=?,
    ~_type: [#meter]=?,
    ~meter: 'meter=?,
    ~gaugeStyle: 'gaugeStyle=?,
    // 图表组件
    ~axis: 'axis=?,
    ~indicator: 'indicator=?,
    ~statistic: 'statistic=?,
    // 事件
    ~events: 'events=?,
  ) => React.element = "GaugeChart"
}
module LiquidChart = {}
module WordCloudChart = {}

module FunnelChart = {}
module ProgressChart = {}
module TinyAreaChart = {}

module TinyLineChart = {}
