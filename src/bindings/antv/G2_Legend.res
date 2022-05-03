module G2LegendTitleCfg = {
  @deriving(abstract)
  type t = {@optional text: string}
}

module LegendBackgroundCfg = {
  type padding
  external padding: 'a => padding = "%identity"
  @deriving(abstract)
  type t = {
    @optional padding: padding,
    @optional style: G2_ShapeAttrs.t,
  }
}

module LegendItemNameCfg = {
  type formatter
  external formatter: 'a => formatter = "identity"
  type style
  external style: G2_ShapeAttrs.t => style = "identity"
  external styleFn: (('item, int, array<'item>) => G2_ShapeAttrs.t) => style = "identity"
  @deriving(abstract)
  type t = {
    // 图例项 name 同后面 value 的间距
    @optional spacing: float,
    // 格式化文本函数
    @optional formatter: formatter,
    // 文本配置项
    @optional style: style,
  }
}

module LegendItemValueCfg = {
  type formatter
  external formatter: 'a => formatter = "identity"
  type style
  external style: G2_ShapeAttrs.t => style = "identity"
  external styleFn: (('item, int, array<'item>) => G2_ShapeAttrs.t) => style = "identity"
  @deriving(abstract)
  type t = {
    // 是否右对齐，默认为 false，仅当设置图例项宽度时生效
    @optional alignRight: bool,
    // 格式化文本函数
    @optional formatter: formatter,
    // 图例项附加值的配置
    @optional style: style,
  }
}

module MarkerCfg = {
  // Marker | MarkerCallback
  type symbol
  type style
  external style: G2_ShapeAttrs.t => style = "%identity"
  external styleFn: G2_ShapeAttrs.t => G2_ShapeAttrs.t = "%identity"
  @deriving(abstract)
  type t = {
    // 图例项 marker 同后面 name 的间距
    @optional spacing: float,
    // 配置图例 marker 的 symbol 形状
    @optional symbol: symbol,
    @optional style: style,
  }
}

module LegendPageNavigatorCfg = {
  @deriving(abstract)
  type markerStyle = {
    /* 分页导航器 icon 填充色, 默认 #000 */
    @optional fill: string,
    /* 分页导航器 icon 填充色 透明度, 默认 1 */
    @optional opacity: float,
    /* 分页导航器 icon 非激活时的填充色 */
    @optional inactiveFill: string,
    /* 分页导航器 icon 非激活时的填充色 透明度, 默认 0.45 */
    @optional inactiveOpacity: float,
    /* 分页器的大小 */
    @optional size: float,
  }
  @deriving(abstract)
  type marker = {@optional style: markerStyle}
  @deriving(abstract)
  type textStyle = {
    /* 分页导航器 文本 填充色，默认 #ccc */
    @optional fill: string,
    /* 字体大小, 默认 12px */
    @optional fontSize: int,
  }
  @deriving(abstract)
  type text = {style: textStyle}
  @deriving(abstract)
  type t = {
    @optional marker: marker,
    @optional text: text,
  }
}

module LegendItem = {
  type value
  external value: 'a => value = "%identity"
  @deriving(abstract)
  type t = {
    // 名称
    name: string,
    // 值
    value: value,
    // 唯一值，用于动画或者查找
    @optional id: string,
    // 图形标记
    @optional marker: MarkerCfg.t,
    // 初始是否处于未激活状态
    @optional unchecked: bool,
  }
}

module ContinueLegendTrackCfg = {
  @deriving(abstract)
  type t = {@optional style: G2_ShapeAttrs.t}
}

module ContinueLegendRailCfg = {
  @deriving(abstract)
  type t = {
    // rail 的类型，color, size
    @optional @as("type") _type: [#color | #size],
    // 滑轨的宽度
    @optional size: float,
    // 滑轨的默认长度，，当限制了 maxWidth,maxHeight 时，不会使用这个属性会自动计算长度
    @optional defaultLength: float,
    // 滑轨的样式
    @optional style: G2_ShapeAttrs.t,
  }
}

module ContinueLegendLabelCfg = {
  type formatter
  external formatter: ('a => string) => formatter = "%identity"
  @deriving(abstract)
  type t = {
    /*
     * 文本同滑轨的对齐方式，有五种类型
     *  - rail ： 同滑轨对齐，在滑轨的两端
     *  - top, bottom: 图例水平布局时有效
     *  - left, right: 图例垂直布局时有效
     */
    @optional align: [#rail | #top | #bottom | #left | #right],
    // 文本格式化
    @optional formatter: formatter,
    // 文本同滑轨的距离
    @optional spacing: float,
    // 文本样式
    @optional style: G2_ShapeAttrs.t,
  }
}

module ContinueLegendHandlerCfg = {
  @deriving(abstract)
  type t = {
    // 滑块大小
    @optional size: float,
    // 滑块样式
    @optional style: G2_ShapeAttrs.t,
  }
}

module LegendCfg = {
  type marker
  external marker: MarkerCfg.t => marker = "%identity"
  external markerFn: ((string, int, 'item) => MarkerCfg.t) => marker = "%identity"
  @deriving(abstract)
  type t = {
    /*
     * 是否为自定义图例，当该属性为 true 时，需要声明 items 属性。
     */
    @optional custom: bool,
    /*
     * 布局方式： horizontal，vertical
     */
    @optional layout: [#horizontal | #vertical],
    /*
     * 图例标题配置，默认不展示。
     *
     * 属性结构如下：
     *
     * ```ts
     * {
     *   spacing: float,    // 标题同图例项的间距
     *   style?: ShapeAttrs;  // 文本样式配置项
     * }
     * ```
     *
     * 详见 {@link https://github.com/antvis/component/blob/81890719a431b3f9088e0c31c4d5d382ef0089df/src/types.ts#L639|LegendTitleCfg}，
     */
    @optional title: G2LegendTitleCfg.t,
    /*
     * 背景框配置项。
     *
     * 属性结构如下：
     *
     * ```ts
     * {
     *   padding?: number | number[]; // 背景的留白
     *   style?: ShapeAttrs;          // 背景样式配置项
     * }
     * ```
     *
     * 详见 {@link https://github.com/antvis/component/blob/81890719a431b3f9088e0c31c4d5d382ef0089df/src/types.ts#L652|LegendBackgroundCfg}
     */
    @optional background: LegendBackgroundCfg.t,
    /* 图例的位置。 */
    @optional
    position: [
      | #top
      | #"top-left"
      | #"top-right"
      | #right
      | #"right-top"
      | #"right-bottom"
      | #left
      | #"left-top"
      | #"#left-bottom"
      | #bottom
      | #"bottom-left"
      | #"bottom-right"
    ],
    /* 动画开关，默认关闭。 */
    @optional animate: bool,
    /* 动画参数配置，当且仅当 `animate` 属性为 true，即动画开启时生效。 */
    @optional animateOption: G2_Animate.ComponentAnimateOption.t,
    /*
     * **分类图例适用**，控制图例项水平方向的间距。
     */
    @optional itemSpacing: float,
    /*
     * **分类图例适用**，控制图例项垂直方向的间距。
     */
    @optional itemMarginBottom: float,
    /*
     * **分类图例适用**，图例项的最大宽度，超出则自动缩略。
     * `maxItemWidth` 可以是像素值；
     * 也可以是相对值（取 0 到 1 范围的数值），代表占图表宽度的多少
     */
    @optional maxItemWidth: float,
    /*
     * **分类图例适用**，图例项的宽度, 默认为 null，自动计算。
     */
    @optional itemWidth: float,
    /*
     * **分类图例适用**，图例的高度，默认为 null。
     */
    @optional itemHeight: float,
    /*
     * **分类图例适用**，图例项 name 文本的配置。
     * 属性结构如下：
     *
     * ```ts
     * {
     *   spacing: float, // 图例项 name 同后面 value 的间距
     *   formatter?: (text: string, item: ListItem, index: number) => any; // 格式化文本函数
     *   style?: ShapeAttrs; // 文本配置项
     * }
     * ```
     *
     * 详见 {@link https://github.com/antvis/component/blob/81890719a431b3f9088e0c31c4d5d382ef0089df/src/types.ts#L665|LegendItemNameCfg}，
     */
    @optional itemName: LegendItemNameCfg.t,
    /*
     * **分类图例适用**，图例项 value 附加值的配置项。
     * 属性结构如下：
     *
     * ```ts
     * {
     *   alignRight: bool, // 是否右对齐，默认为 false，仅当设置图例项宽度时生效
     *   formatter?: (text: string, item: ListItem, index: number) => any; // 格式化文本函数
     *   style?: ShapeAttrs; // 图例项附加值的配置
     * }
     * ```
     *
     * 详见 {@link https://github.com/antvis/component/blob/81890719a431b3f9088e0c31c4d5d382ef0089df/src/types.ts#L685|LegendItemValueCfg}，
     */
    @optional itemValue: LegendItemValueCfg.t,
    /*
     * **分类图例适用**，图例项最大宽度设置。
     */
    @optional maxWidth: float,
    /*
     * **分类图例适用**，图例项最大高度设置。
     */
    @optional maxHeight: float,
    /*
     * **分类图例适用**，图例项的 marker 图标的配置。
     */
    @optional marker: marker,
    /*
     * **适用于分类图例**，当图例项过多时是否进行分页。
     */
    @optional flipPage: bool,
    /*
     *  **适用于分类图例**，图例分页器的样式设置。
     */
    @optional pageNavigator: LegendPageNavigatorCfg.t,
    /*
     * **分类图例适用**，用户自己配置图例项的内容。
     */
    @optional items: array<LegendItem.t>,
    /*
     * **分类图例适用**，是否将图例项逆序展示。
     */
    @optional reversed: bool,
    /*
     * **连续图例适用**，选择范围的最小值。
     */
    @optional min: float,
    /*
     * **连续图例适用**，选择范围的最大值。
     */
    @optional max: float,
    /*
     * **连续图例适用**，选择的值。
     */
    @optional value: array<float>,
    /*
     * **连续图例适用**，选择范围的色块样式配置项。
     * 属性结构如下：
     *
     * ```ts
     * {
     *   style?: ShapeAttrs; // 选定范围的样式
     * }
     * ```
     *
     * 详见 {@link https://github.com/antvis/component/blob/81890719a431b3f9088e0c31c4d5d382ef0089df/src/types.ts#L574|ContinueLegendTrackCfg}
     */
    @optional track: ContinueLegendTrackCfg.t,
    /*
     * **连续图例适用**，图例滑轨（背景）的样式配置项。
     * 属性结构如下：
     *
     * ```ts
     * {
     *   type?: string; // rail 的类型，color, size
     *   size: float, // 滑轨的宽度
     *   defaultLength: float, // 滑轨的默认长度，，当限制了 maxWidth,maxHeight 时，不会使用这个属性会自动计算长度
     *   style?: ShapeAttrs; // 滑轨的样式
     * }
     * ```
     *
     * 详见 {@link https://github.com/antvis/component/blob/81890719a431b3f9088e0c31c4d5d382ef0089df/src/types.ts#L595|ContinueLegendRailCfg}，
     */
    @optional rail: ContinueLegendRailCfg.t,
    /*
     * **连续图例适用**，文本的配置项。
     * 属性结构如下：
     *
     * ```ts
     * {
     *   // 文本同滑轨的对齐方式，有五种类型
     *   // rail ： 同滑轨对齐，在滑轨的两端
     *   // top, bottom: 图例水平布局时有效
     *   // left, right: 图例垂直布局时有效
     *   align?: string;
     *   spacing: float, // 文本同滑轨的距离
     *   style?: ShapeAttrs; // 文本样式
     * }
     * ```
     *
     * 详见 {@link https://github.com/antvis/component/blob/81890719a431b3f9088e0c31c4d5d382ef0089df/src/types.ts#L618|ContinueLegendLabelCfg}
     */
    @optional label: ContinueLegendLabelCfg.t,
    /*
     * **连续图例适用**，滑块的配置项。
     * 属性结构如下：
     *
     * ```ts
     * {
     *   size: float, // 滑块的大小
     *   style?: ShapeAttrs; // 滑块的样式设置
     * }
     * ```
     *
     * 详见 {@link https://github.com/antvis/component/blob/81890719a431b3f9088e0c31c4d5d382ef0089df/src/types.ts#L582|ContinueLegendTrackCfg}，
     */
    @optional handler: ContinueLegendHandlerCfg.t,
    /*
     * **连续图例适用**，滑块是否可以滑动。
     */
    @optional slidable: bool,
    /* 图例 x 方向的偏移。 */
    @optional offsetX: float,
    /* 图例 y 方向的偏移。 */
    @optional offsetY: float,
    /* 图例在四个方向的偏移量 */
    @optional padding: array<float>,
    /*
     * 图例高亮状态，false 表示默认置灰，无或 true 表示高亮
     */
    @optional selected: Js.Dict.t<bool>,
  }
}

module LegendController = {
  type t
}
