module TrendCfg = {
  type backgroundStyle
  external backgroundStyle: 'a => backgroundStyle = "%identity"
  type lineStyle
  external lineStyle: 'a => lineStyle = "%identity"
  type areaStyle
  external areaStyle: 'a => areaStyle = "%identity"

  @deriving(abstract)
  type t = {
    // 数据
    data: array<float>,
    // 样式
    @optional smooth: bool,
    @optional isArea: bool,
    @optional backgroundStyle: backgroundStyle,
    @optional lineStyle: lineStyle,
    @optional areaStyle: areaStyle,    
  }
}

module SliderCfg = {
  // (val: any, datum: Datum, idx: number) => any
  type formatter
  external formatter: 'a => formatter = "%identity"

  type backgroundStyle
  type foregroundStyle
  type handlerStyle
  type textStyle

  @deriving(abstract)
  type t = {
    /** slider 高度 */
    @optional height: float,
    /** 滑块背景区域配置 */
    // readonly trendCfg?: Omit<TrendCfg, 'data'> & { data?: number[] };
    @optional trendCfg: TrendCfg.t,
    /** 滑块背景样式 */
    @optional backgroundStyle: backgroundStyle,
    /** 滑块前景样式 */
    @optional foregroundStyle: foregroundStyle,
    /** 滑块两个操作块样式 */
    @optional handlerStyle: handlerStyle,
    /** 文本样式 */
    @optional textStyle: textStyle,
    /** 允许滑动位置的最小值 */
    @optional minLimit: float,
    /** 允许滑动位置的最大值 */
    @optional maxLimit: float,
    /** 滑块初始化的起始位置 */
    @optional start: float,
    /** 滑块初始化的结束位置 */
    @optional end: float,
    /** 布局的 padding */
    @optional padding: array<float>,
    /** 滑块文本格式化函数 */
    @optional formatter: formatter,
  }
}

module SliderController = {
  type t
}