module CoordinateCfg = {
  @deriving(abstract)
  type t = {
    /**
     * 用于极坐标，配置起始弧度。
     */
    @optional startAngle: float,
    /**
     * 用于极坐标，配置结束弧度。
     */
    @optional endAngle: float,
    /**
     * 用于极坐标，配置极坐标半径，0 - 1 范围的数值。
     */
    @optional radius: float,
    /**
     * 用于极坐标，极坐标内半径，0 -1 范围的数值。
     */
    @optional innerRadius: float,
  }
}

/** 坐标系支持的 action 配置 */
module CoordinateActions = {
  type t
  external coordinateRotate: (([#rotate], float)) => t = "%identity"
  external coordinateReflect: (([#reflect], [#x | #y])) => t = "%identity"
  external coordinateScale: (([#scale], float, float)) => t = "%identity"
  external coordinateTranspose: [#transpose] => t = "%identity"
}

module CoordinateOption = {
  @deriving(abstract)
  type t = {
    /** 坐标系类型 */
    @optional @as("type") _type: [#cartesian | #rect | #polar | #helix | #theta],
    /** 坐标系配置项，目前常用于极坐标。 */
    @optional cfg: CoordinateCfg.t,
    /**
     * 坐标系变换操作:
     * 1. rotate 表示旋转，使用弧度制。
     * 2. scale 表示沿着 x 和 y 方向的缩放比率。
     * 3. reflect 表示沿 x 方向镜像或者沿 y 轴方向映射。
     * 4. transpose 表示 x，y 轴置换。
     */
    @optional actions: array<CoordinateActions.t>,
  }
}

module Coordinate = {
  type t
}

module CoordinateController = {
  type t

  @send external update: (t, CoordinateOption.t) => t = "update"
  @send external hasAction: (t, string) => bool = "hasAction"
  @send external create: (t, 'point, 'point) => Coordinate.t = "create"
  @send external adjust: (t, 'point, 'point) => t = "adjust"
  @send external rotate: (t, float) => t = "rotate"
  @send external reflect: (t, [#x | #y]) => t = "reflect"
  @send external scale: (t, float, float) => t = "scale"
  @send external getOption: (t) => CoordinateOption.t = "getOption"
  @send external getCoordinate: (t) => Coordinate.t = "getCoordinate"
  @send external wrapperOption: (t, CoordinateOption.t) => CoordinateOption.t = "wrapperOption"
  @send external execActions: (t, array<string>) => unit = "execActions"
}
