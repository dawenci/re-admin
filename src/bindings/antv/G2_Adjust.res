/* 数据调整配置项定义，`geometry.adjust({})` */
module AdjustOption = {
  @deriving(abstract)
  type t = {
    // 数据调整类型。
    @as("type") _type: [#stack | #jitter | #dodge | #symmetric],
    // 该属性只对 'dodge' 类型生效，取 0 到 1 范围的值（相对于每个柱子宽度），用于控制一个分组中柱子之间的间距。
    // ![image](https://gw.alipayobjects.com/mdn/rms_2274c3/afts/img/A*ps3pToOg2nwAAAAAAAAAAABkARQnAQ)
    @optional marginRatio: float,
    // 该属性只对 'dodge' 类型生效，声明以哪个数据字段为分组依据。
    @optional dodgeBy: string,
    // 该属性只对 'stack' 类型生效，用于控制是否对数据进行反序操作。
    @optional reverseOrder: bool,
  }

  external unsafeMake: {..} => t = "%identity"
}
