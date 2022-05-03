// ============================ 基础类型 ============================
/* 一个点位置 */
module Point = {
  type t = {x: float, y: float}
}

/* 画布范围 */
module Region = {
  type t = {start: Point.t, end: Point.t}
}

/* 画布大小 */
module Size = {
  type t = {width: float, height: float}
}

/* 带范围的点结构 */
module RangePoint = {
  // export interface RangePoint {
  //   readonly x?: number | number[];
  //   readonly y?: number | number[];
  // }

}

// ============================ Geometry 接口相关的类型定义 ============================

module Padding = {
  type t

  external unsafeMake: {..} => t = "%identity"
}
