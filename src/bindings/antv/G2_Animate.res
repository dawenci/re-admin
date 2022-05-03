// 用户配置的动画，属性均可选
module AnimateCfg = {
  type easing
  external easing: 'a => easing = "%identity"
  type duration
  external duration: 'a => duration = "%identity"
  type delay
  external delay: 'a => delay = "%identity"
  type callback
  external callback: 'a => callback = "%identity"

  @deriving(abstract)
  type t = {
    /* 动画缓动函数 */
    @optional easing: easing,
    /* 动画执行函数 */
    @optional animation: string,
    /* 动画执行时间 */
    @optional duration: duration,
    /* 动画延迟时间 */
    @optional delay: delay,
    /* 动画执行结束后的回调函数 */
    @optional callback: callback,
    /* 动画是否重复 */
    @optional repeat: bool,
  }

  external unsafeMake: {..} => t = "%identity"
}

module AnimateOption = {
  @deriving(abstract)
  type t = {
    /* chart 初始化渲染时的入场动画，false/null 表示关闭入场动画。 */
    @optional appear: Js.Nullable.t<AnimateCfg.t>,
    /* chart 发生更新时，新增元素的入场动画，false/null 表示关闭入场动画。 */
    @optional enter: Js.Nullable.t<AnimateCfg.t>,
    /* 更新动画配置，false/null 表示关闭更新动画。 */
    @optional update: Js.Nullable.t<AnimateCfg.t>,
    /* 销毁动画配置，false/null 表示关闭销毁动画。 */
    @optional leave: Js.Nullable.t<AnimateCfg.t>,
  }

  external unsafeMake: {..} => t = "%identity"
}

module ComponentAnimateCfg = {
  @deriving(abstract)
  type t = {
    /* 动画执行时间 */
    @optional duration: float,
    /* 动画缓动函数 */
    @optional easing: string,
    /* 动画延迟时间 */
    @optional delay: float,
  }

  external unsafeMake: {..} => t = "%identity"
}

module ComponentAnimateOption = {
  @deriving(abstract)
  type t = {
    /* 初入场动画配置 */
    @optional appear: ComponentAnimateCfg.t,
    /* 更新动画配置 */
    @optional update: ComponentAnimateCfg.t,
    /* 更新后新入场的动画配置 */
    @optional enter: ComponentAnimateCfg.t,
    /* 离场动画配置 */
    @optional leave: ComponentAnimateCfg.t,
  }

  external unsafeMake: {..} => t = "%identity"
}
