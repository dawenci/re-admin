/* 一个点位置 */
module Point = {
  type t = {x: float, y: float}
}

module Shape = {
  type t

  @send external parsePoint: (t, Point.t) => Point.t = "parsePoint"
}

// ShapeFactory 名称，对应 Geometry 几何标记名称
type factoryName = [#point | #line | #area | #interval | #polygon | #violin | #schema | #edge]

module ShapePoint = {
  type xyValue
  external xyValue: (@unwrap [#Number(float) | #Numbers(array<float>)]) => xyValue = "%identity"

  @deriving(abstract)
  type t = {
    x: xyValue,
    @optional y: xyValue,
    @optional y0: float,
    @optional size: int,
  }
}

module ShapeMarkerCfg = {
  type t = {
    color: string,
    isInPolar: bool
  }
}

module ShapeMarkerAttrs = {
  type t
  external unsafeMake: 'a => t = "%identity"
}

module ShapeInfo = {
  type t
  external unsafeMake: 'a => t = "%identity"

  @get external getX: t => float = "x"
  @get external getY: t => float = "y"
  @get external getColor: t => string = "color"
}

module IShape = {
  type t
}

module ShapeCfg = {
  type t
  external unsafeMake: 'a => t = "%identity"
}

module IGroup = {
  type t
  external unsafeMake: 'a => t = "%identity"

  @send external addGroup: t => t = "addGroup"
  @send external addShape: (t, ShapeCfg.t) => IShape.t = "addShape"
  @send external addShapeFactory: (t, [>], ShapeCfg.t) => IShape.t = "addShape"
}

module GroupCfg = {
  type t

}

/** 注册具体 shape 需要实现的接口。 */
module RegisterShape = {
  type t
  @obj external make: (
    ~draw: @this (Shape.t, ShapeInfo.t, IGroup.t) => 'res,
    ~getPoints: ShapePoint.t => array<Point.t>=?,
    ~getMarker: ShapeMarkerCfg.t => ShapeMarkerAttrs.t=?,
    unit
  ) => t = ""

}


@module("@antv/g2") external registerShape: (factoryName, [>], RegisterShape.t) => Shape.t = "registerShape"
