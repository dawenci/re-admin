type facetType = [
  | #rect
  | #list
  | #circle
  | #tree
  | #mirror
  | #matrix
]

module Padding = {
  type t
  external number: float => t = "%identity"
  external array: array<float> => t = "%identity"
  external auto_: string => t = "%identity"
  let auto = auto_("auto")
}

module FacetCfg = {
  type view

  @deriving(abstract)
  type t<'d> = {
    /** facet 数据划分维度。 */
    fields: array<string>,
    /** view 创建回调。 */
    eachView: (~innerView: view, ~facet: 'd=?) => unit,    
    /** 布局类型。 */
    @optional @as("type") _type: string,
    /** facet view padding。 */
    @optional padding: Padding.t,
    /** 是否显示标题。 */
    @optional showTitle: bool,
  }
}