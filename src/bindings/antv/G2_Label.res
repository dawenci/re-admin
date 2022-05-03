module GeometryLabelCfg = {
  type looseObject

  module Background = {
    type padding
    external padding: float => padding = "%identity"
    external paddingArray: array<float> => padding = "%identity"

    @deriving(abstract)
    type t = {
      @optional style: G2_ShapeAttrs.t,
      /* 背景框 内边距 */
      @optional padding: padding,
    }
  }

  module GeometryLabelLayoutCfg = {
    @deriving(abstract)
    type t = {
      /* label 布局类型。 */
      @optional @as("type") _type: string,
      /* 各个布局函数开放给用户的配置。 */
      @optional cfg: looseObject
    }
  }  

  type offset
  external offset: float => offset = "%identity"
  external offsetString: string=>offset = "%identity"

  type content // string | IGroup | IShape | GeometryLabelContentCallback;

  type labelLine // null | boolean | { style?: object }

  type layout
  external layout: GeometryLabelLayoutCfg.t => layout = "%identity"
  external layoutArray: array<GeometryLabelLayoutCfg.t> => layout = "%identity"

  type animate // false | null
  external animateToggle: bool => animate = "%identity"
  external animate: G2_Animate.AnimateOption.t => animate = "%identity"

  // | ((data: Datum, mappingData: MappingDatum, index: number) => IntervalGeometryLabelPosition)
  // | IntervalGeometryLabelPosition;
  type position_ = [#top | #bottom | #middle | #left | #right]
  type position
  external position: position_ => position = "%identity"
  external positionFn: (('datum, 'mappingDatum, int) => position_) => position = "%identity"
      
  @deriving(abstract)
  type t = {
  /*
    * 用于声明渲染的 label 类型。
    * 当用户使用了自定义的 label 类型，需要声明具体的 type 类型，否则会使用默认的 label 类型渲染。
    */
    @optional @as("type") _type: string,
    /* 相对数据点的偏移距离, polar 和 theta 坐标系下可使用百分比字符串。 */
    @optional offset: offset,
    /* label 相对于数据点在 X 方向的偏移距离。 */
    @optional offsetX: float,
    /* label 相对于数据点在 Y 方向的偏移距离。 */
    @optional offsetY: float,
    /*
    * 展示的文本内容，如果不声明则按照参与映射的第一字段的值进行显示。
    * 当 content 为 IGroup 或者 IShape 类型时，请使用相对定位，即 x 和 y 坐标都设为 0，G2 内部会整体做最后的 label 进行定位的。
    * 示例： https://g2.antv.vision/zh/examples/pie/basic#pie-custome-label
    */
    @optional content: content,
    /* label 文本图形属性样式。 */
    @optional style: looseObject,
    /* label 是否自动旋转，默认为 true。 */
    @optional autoRotate: bool,
    /*
    * 当且仅当 `autoRotate` 为 false 时生效，用于设置文本的旋转角度，**弧度制**。
    */
    @optional rotate: float,
    /* 标签高度设置，仅当标签类型 type 为 pie 时生效；也可在主题中设置 pieLabels.labelHeight */
    @optional labelHeight: float,
    /*
    * 用于设置文本连接线的样式属性，null 表示不展示。
    */
    @optional labelLine: labelLine,
    /* 只对极坐标下的文本生效，表示文本是否按照角度进行放射状显示，true 表示开启，false 表示关闭。 */
    @optional labelEmit: bool,
    /*
    * 文本布局类型，支持多种布局函数组合使用。
    *
    * 目前提供了三种：'overlap'，'fixedOverlap'，'limitInShape'：
    * 1. overlap: label 防遮挡，为了防止 label 之间相互覆盖，通过尝试向**四周偏移**来剔除放不下的 label。
    * 2. fixed-overlap: 不改变 label 位置的情况下对相互重叠的 label 进行调整。
    * 3. limit-in-shape: 剔除 shape 容纳不了的 label。
    *
    * @example
    * ```ts
    * layout: {
    *   type: 'overlap',
    * },
    * ```
    */
    @optional layout: layout,
    /*
    * 用于绘制 label 背景
    */
    @optional background: Background.t,
    /*
    * 仅当 geometry 为 interval 时生效，指定当前 label 与当前图形的相对位置。
    */
    @optional position: position,
    /* 动画配置。 */
    @optional animate: animate, 
  }

  external unsafeMake: {..} => t = "%identity"
}

module LabelOption = {
  type t
  external unsafeMake: {..} => t = "%identity"
}
