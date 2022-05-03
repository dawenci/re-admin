type actionName = [
  | #"active-region"
  | #"view-zoom"
  | #"element-active"
  | #"element-selected"
  | #"element-single-selected"
  | #"element-highlight"
  | #"element-highlight-by-x"
  | #"element-highlight-by-color"
  | #"legend-filter"
  | #"legend-visible-filter"
  | #"continuous-filter"
  | #"continuous-visible-filter"
  | #"legend-active"
  | #"legend-highlight"
  | #"axis-label-highlight"
  | #"element-list-highlight"
  | #brush
  | #"brush-x"
  | #"brush-y"
  | #"brush-visible"
]

module Action = {
  type t
}

/* * 交互上下文的接口定义 */
module InteractionContext = {
  type t

  // 当前触发的事件对象
  @get external event: t => 'event = "event"
  // 当前的 view
  @get external view: t => 'view = "view"
  // 交互相关的 Actions
  @get external actions: t => array<Action.t> = "actions"
  // 缓存属性，用于上下文传递信息
  @send external cache: (t, string, Action.t) => 'unit = "cache"
  // 获取 action
  @send external getAction: t => Action.t = "getAction"
  // 获取当前的点
  @send external getCurrentPoint: t => 'point = "getCurrentPoint"
  // 获取当前的图形
  @send external getCurrentShape: t => 'shape = "getCurrentShape"
  // 添加 action
  @send external addAction: (t, Action.t) => unit = "removeAction"
  // 移除 action
  @send external removeAction: (t, Action.t) => unit = "removeAction"
  // 事件触发时是否在 view 内部
  @send external isInPlot: t => bool = "isInPlot"
  // 是否在组件的包围盒内，参数为组件名，可省略
  @send external isInComponent: (t, ~name: string=?, unit) => bool = "isInComponent"
  // 是否在指定的图形内，参数为 shape 的名称
  @send external isInShape: (t, string) => bool = "isInShape"
  // 销毁
  @send external destroy: t => unit = "destroy"
}

module InteractionCfg = {
  // string | string[] | ActionCallback
  type action
  external action: (@unwrap [#Str(string) | #Arr(array<string>) | #Fn(InteractionContext.t => unit)]) => action = ""

  @deriving(abstract)
  type debounce = {
    wait: int,
    @optional immediate: bool
  }

  @deriving(abstract)
  type throttle = {
    wait: int,
    @optional leading: bool,
    @optional trailing: bool
  }

  @deriving(abstract)
  type interactionStep = {
    // 触发事件，支持 view，chart 的各种事件，也支持 document、window 的事件
    trigger: string,
    action: action,
    @optional isEnable: InteractionContext.t => bool,
    @optional callback: InteractionContext.t => unit,
    @optional once: bool,
    @optional debounce: debounce,
    @optional throttle: throttle,
  }

  /** 交互的所有环节 */
  @deriving(abstract)
  type t = {
    @optional showEnable: array<interactionStep>,
    @optional start: array<interactionStep>,
    @optional processing: array<interactionStep>,
    @optional end: array<interactionStep>,
    @optional rollback: array<interactionStep>,
  }
}
