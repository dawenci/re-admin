module AttributeOption = {
  type value
  external value: 'a => value = "%identity"

  type callback
  external callback: 'a => callback = "%identity"

  @deriving(abstract)
  type t = {
    /* 映射的属性字段。 */
    @optional fields: array<string>,
    /* 回调函数。 */
    @optional callback: callback,
    /* 指定常量映射规则。 */
    @optional values: array<value>,
  }

  external unsafeMake: {..} => t = "%identity"
}

type t

// 各种方法调用形式，最终换转换成 AttributeOption 的形式：
// .方法名("value") 相当于 ({ values: ["value"] })
// .方法名("x*y") 相当于 方法名({ fields: ["x", "y"] })
// .方法名("x*y", (x, y) => {/*...*/}) 相当于 .方法名({ fields: ["x", "y"], callback: (x, y) => {/*...*/} })

@send external positionField: (t, string) => t = "position"
@send external positionFields: (t, array<string>) => t = "position"
@send external positionOption: (t, AttributeOption.t) => t = "position"

@send external colorValue: (t, string) => t = "color"
@send external colorField: (t, string) => t = "color"
@send external colorFieldValue: (t, string, string) => t = "color"
@send external colorFieldValues: (t, string, array<string>) => t = "color"
@send external colorFieldCallback: (t, string, 'fn) => t = "color"
@send external colorOption: (t, AttributeOption.t) => t = "color"

@send
external shapeValue: (t, [> ]) => t = "shape"
@send external shapeField: (t, string) => t = "shape"
@send external shapeFieldValues: (t, string, array<string>) => t = "shape"
@send external shapeFieldCallback: (t, string, 'fn) => t = "shape"
@send external shapeOption: (t, AttributeOption.t) => t = "shape"

@send external sizeValue: (t, float) => t = "size"
@send external sizeField: (t, string) => t = "size"
@send external sizeFieldValueRange: (t, string, (float, float)) => t = "size"
@send external sizeFieldCallback: (t, string, 'fn) => t = "size"
@send external sizeOption: (t, AttributeOption.t) => t = "size"

@send external adjustType: (t, [#dodge | #stack | #symmetric | #jitter]) => t = "adjust"
@send external adjustTypes: (t, array<[#dodge | #stack | #symmetric | #jitter]>) => t = "adjust"
@send external adjustOption: (t, G2_Adjust.AdjustOption.t) => t = "adjust"
@send external adjustOptions: (t, array<G2_Adjust.AdjustOption.t>) => t = "adjust"

@send external styleAttrs: (t, G2_ShapeAttrs.t) => t = "style"
@send external styleFieldCallback: (t, string, 'fn) => t = "style"
@send external styleOption: (t, G2_Style.StyleOption.t) => t = "style"

@send external tooltipToggle: (t, bool) => t = "tooltip"
@send external tooltipField: (t, string) => t = "tooltip"
@send external tooltipFieldCallback: (t, string, 'fn) => t = "tooltip"
@send external tooltipOption: (t, G2_Tooltip.GeometryTooltipOption.t) => t = "tooltip"

@send external animateToggle: (t, bool) => t = "animate"
@send external animateOption: (t, G2_Animate.AnimateOption.t) => t = "animate"

@send external labelHide: (t, @as(json`false`) _) => t = "label"
@send external labelField: (t, string) => t = "label"
@send external labelFieldConfig: (t, string, G2_Label.GeometryLabelCfg.t) => t = "label"
@send
external labelFieldCallbackConfig: (t, string, 'fn, G2_Label.GeometryLabelCfg.t) => t = "label"
@send external labelFieldCallback: (t, string, 'fn) => t = "label"
@send external labelOption: (t, G2_Label.LabelOption.t) => t = "label"

@send external state: (t, 'stateOption) => t = "state"

@send external customInfo: (t, 'info) => t = "customInfo"

@send external paint: (t, bool) => t = "paint"
@send external clear: t => t = "clear"
@send external destroy: t => t = "destroy"

// https://github.com/antvis/attr/blob/43f82e47383101757da597e38ce882d253d70653/src/attributes/base.ts#L18
@send
external getAttribute: (t, [#color | #size | #position | #shape]) => 'attribute = "getAttribute"

@send external getXScale: t => 'scale = "getXScale"
@send external getYScale: t => 'scale = "getYScale"
@send external getXYFields: t => (string, string) = "getXYFields"
@send external getElementsBy: t => array<'element> = "getElementsBy"
