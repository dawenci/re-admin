type target
type gevent
type event

type t = {
  target: target, // 触发的对象，图形或者 Canvas 对象
  view: BizCharts_View.t, // 当前 target 所属的 view
  gEvent: gevent, // 从底层 G 的绘图层抛出来的事件，详情参考：G 的事件详解
  event: event, // dom 层的事件
  x: float, // 触发的位置 x，相对于画布左上角的位置
  y: float, // 触发的位置 y，相对于画布左上角的位置
  clientX: float, // 视窗的位置 x
  clientY: float, // 视窗的位置 y
}
