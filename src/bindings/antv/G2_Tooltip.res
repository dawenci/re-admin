module TooltipTitle = {
  type t
  external string: string => t = "%identity"
  external fn: ((string, 'datum) => string) => t = "%identity"
}

module CrosshairLineCfg = {
  @deriving(abstract)
  type t = {
    @optional style: G2_ShapeAttrs.t,
  }
}

module TooltipCrosshairsText = {
  @deriving(abstract)
  type t = {
    @optional content: string
    // 是否自动旋转
    @optional autoRotate: bool,
    // 文本的配置项
    @optional style: G2_ShapeAttrs.t,
  }
}

module CrosshairTextBackgroundCfg = {
  type t
}

module TooltipCrosshairs = {
  type text
  external text: TooltipCrosshairsText.t => text = "%identity"
  external textFn: ((string, 'defaultContent, 'items, 'currentPoint) => TooltipCrosshairsText.t) => text = "%identity"

  @deriving(abstract)
  type t = {
    // crosshairs 的类型: `x` 表示 x 轴上的辅助线，`y` 表示 y 轴上的辅助项
    @optional @as("type") _type: [#x | #y | #xy],
    // 辅助线的样式配置
    @optional line: CrosshairLineCfg.t,
    // 辅助线文本配置，支持回调
    @optional text: text,
    // 辅助线文本背景配置。
    @optional textBackground: CrosshairTextBackgroundCfg.t,
    /** 辅助线是否跟随鼠标移动，默认为 false，即定位到数据点 */
    @optional follow: bool,
  }
}

module TooltipDomStyles = {
  type looseObject
  external looseObject: 'a => looseObject = "%identity"

  @deriving(abstract)
  type t = {
    @optional \"g2-tooltip": looseObject,
    @optional \"g2-tooltip-title": looseObject,
    @optional \"g2-tooltip-list": looseObject,
    @optional \"g2-tooltip-list-item": looseObject,
    @optional \"g2-tooltip-marker": looseObject,
    @optional \"g2-tooltip-value": looseObject,
    @optional \"g2-tooltip-name": looseObject,
  }
}

module TooltipCfg = {
  type marker
  type showContent // boolean | ((datum: Datum) => boolean);
  type container // string | HTMLElement
  type customItems // (originalItems: TooltipItem[]) => TooltipItem[]
  type customContent // (title: string, data: any[]) => string | HTMLElement;

  @deriving(abstract)
  type t = {
    /**
    * 设置 tooltip 内容框是否跟随鼠标移动。
    * 默认为 true，跟随鼠标移动，false 则固定位置不随鼠标移动。
    */
    @optional follow: bool,
    /** tooltip 是否允许鼠标滑入，默认为 false，不允许 */
    @optional enterable: bool,
    /** tooltip 显示延迟（ms），默认为 16ms，建议在 enterable = true 的时候才设置  */
    @optional showDelay: float,
    /** 是否展示 tooltip 标题。 */
    @optional showTitle: bool,
    /**
    * 设置 tooltip 的标题内容：如果值为数据字段名，则会展示数据中对应该字段的数值，如果数据中不存在该字段，则直接展示 title 值。
    * 同时支持传入方法，回调的方式返回字符串
    */
    @optional title: TooltipTitle.t,
    /** 设置 tooltip 的固定展示位置，相对于数据点。 */
    @optional position: [#top| #bottom|#left| #right],
    /** true 表示合并当前点对应的所有数据并展示，false 表示只展示离当前点最逼近的数据内容。 */
    @optional shared: bool, // 是否只展示单条数据
    /** 是否展示 crosshairs。 */
    @optional showCrosshairs: bool,
    /** 配置 tooltip 的 crosshairs，当且仅当 `showCrosshairs` 为 true 时生效。 */
    @optional crosshairs: TooltipCrosshairs.t,
    /** 是否渲染 tooltipMarkers。 */
    @optional showMarkers: bool,
    /** tooltipMarker 的样式配置。 */
    @optional marker: marker,
    /** 是否展示 tooltip 内容框 */
    @optional showContent: showContent,
    /** 自定义 tooltip 的容器。 */
    @optional container: container,
    /** 用于指定图例容器的模板，自定义模板时必须包含各个 dom 节点的 class。 */
    @optional containerTpl: string,
    /** 每项记录的默认模板，自定义模板时必须包含各个 dom 节点的 class。 */
    @optional itemTpl: string,
    /** 传入各个 dom 的样式。 */
    @optional domStyles: TooltipDomStyles.t,
    /** tooltip 偏移量。 */
    @optional offset: float,
    /** 是否将 tooltip items 逆序 */
    @optional reversed: bool,
    /** 是否显示空值的 tooltip 项目 */
    @optional showNil: bool,
    /** 在 tooltip 渲染之前，对最终的 items 进行自定义处理（比如排序、过滤、格式化等） */
    @optional customItems: customItems,
    /** 支持自定义模板 */
    @optional customContent: customContent
  }
}

module TooltipController = {
  type t
}


module GeometryTooltipOption = {
  type callback
  external callback: 'a => callback = "%identity"

  @deriving(abstract)
  type t = {
    fields: array<string>,
    callback: callback
  }

  external unsafeMake: {..} => t = "%identity"
}
