/** 滚动条组件配置项 */
module ScrollbarCfg = {
  module Style = {
    @deriving(abstract)
    type t = {
      /** 滑道颜色 */
      @optional trackColor: string,
      /** 滑块颜色 */
      @optional thumbColor: string,
      /** 滑块高亮样式，对应主题的 hover.style.thumbColor */
      @optional thumbHighlightColor: string,
      // 是否圆角，'round'
      @optional lineCap: string,
    }
  }

  @deriving(abstract)
  type t = {
    /** 滚动条类型，默认 horizontal  */
    @optional @as("type") _type: [#horizontal | #vertical],
    /** 宽度，在 vertical 下生效 */
    @optional width: float,
    /** 高度，在 horizontal 下生效 */
    @optional height: float,
    /** 可选 padding */
    @optional padding: array<float>,
    /** 对应水平滚动条，为 X 轴每个分类字段的宽度；对于垂直滚动条，为 X 轴每个分类字段的高度 */
    @optional categorySize: float,
    /** 滚动的时候是否开启动画，默认跟随 view 中 animate 配置 */
    @optional animate: bool,
    /** 主题样式设置, 暂不提供 hover 高亮滑块样式配置 */
    @optional style: Style.t,
  }
}

module ScrollbarController = {
  type t
}