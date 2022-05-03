// 坐标轴线定义
module AxisLineCfg = {
  @deriving(abstract)
  type t = {
    // 坐标轴线的配置项
    @optional style: G2_ShapeAttrs.t,
  }
}

// 坐标轴刻度定义
module AxisTickLineCfg = {
  @deriving(abstract)
  type t = {
    // 坐标轴刻度线的配置项
    @optional style: G2_ShapeAttrs.t,
    // 是否同 tick 对齐
    @optional alignTick: bool,
    // 长度
    @optional length: float,
  }
}

// 坐标轴子刻度定义
module AxisSubTickLineCfg = {
  @deriving(abstract)
  type t = {
    // 坐标轴刻度线的配置项
    @optional style: G2_ShapeAttrs.t,
    // 子刻度个数
    @optional count: int,
    // 子刻度线长度
    @optional length: float,
  }
}

// 坐标轴标题定义
module AxisTitleCfg = {
  @deriving(abstract)
  type t = {
    // 标题距离坐标轴的距离
    @optional offset: float,
    // 标题文本配置项
    @optional style: G2_ShapeAttrs.t,
    // 是否自动旋转
    @optional autoRotate: bool,
  }
}

// 坐标轴文本定义
module AxisLabelCfg = {
  type formatter
  external formatter: 'a => formatter = "%identity"
  type autoRotate
  external autoRotate: 'a => autoRotate = "%identity"
  type autoHide
  external autoHide: 'a => autoHide = "%identity"
  type autoEllipsis
  external autoEllipsis: 'a => autoEllipsis = "%identity"

  @deriving(abstract)
  type t = {
    // 坐标轴文本的样式
    @optional style: G2_ShapeAttrs.t,
    // label 的偏移量
    @optional offset: float,
    // 文本旋转角度
    @optional rotate: float,
    // 格式化函数
    @optional formatter: formatter,
    // 是否自动旋转，默认 true
    @optional autoRotate: autoRotate,
    // 是否自动隐藏，默认 false
    @optional autoHide: autoHide,
    // 是否自动省略，默认 false
    @optional autoEllipsis: autoEllipsis,
  }
}

module GridLineCfg = {
  @deriving(abstract)
  type t = {
    @optional @as("type") _type: [#line | #circle],
    @optional style: G2_ShapeAttrs.t,
  }
}

module AxisGridCfg = {
  // string, array<string>
  type alternateColor
  external alternateColor: 'a => alternateColor = "%identity"

  @deriving(abstract)
  type t = {
    @optional line: GridLineCfg.t,
    @optional alternateColor: alternateColor,
    @optional closed: bool,
    @optional alignTick: bool
  }
  external fromAny: 'a => t = "%identity"
}

module AxisOption = {
  @deriving(abstract)
  type t = {
    @optional top: bool,
    @optional position: [#top | #right | #bottom | #left],
    @optional line: Js.Nullable.t<AxisLineCfg.t>,
    @optional tickLine: Js.Nullable.t<AxisTickLineCfg.t>,
    @optional subTickLine: Js.Nullable.t<AxisSubTickLineCfg.t>,
    @optional title: Js.Nullable.t<AxisTitleCfg.t>,
    @optional label: Js.Nullable.t<AxisLabelCfg.t>,
    @optional grid: Js.Nullable.t<AxisGridCfg.t>,
    @optional animate: bool,
    @optional animateOption: G2_Animate.ComponentAnimateOption.t,
    @optional verticalFactor: float,
    @optional verticalLimitLength: float,
  }

  external unsafeMake: {..} => t = "%identity"
}

module AxisController = {
  type t
}
