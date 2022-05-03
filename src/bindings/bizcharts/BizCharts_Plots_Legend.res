// type title = {
//   "title": string, //文本显示内容
//   "spacing": float, //标题同图例项的间距
//   "style": 'style, //文本样式配置项，参考  绘图属性
// }

// type background = {
//   "padding": 'padding, //  number | number[]	背景的留白
//   "style": 'style,
// }

// type pageNavigator = {

// }

// type legendCfg = {
//   "layout": option<string>,// 图例的布局方式，可选项：horizontal | "vertical": 
//   "title": option<title>,// 图例标题配置，默认不展示。详见 title 配置 
//   "position": option<string>,// 图例的位置。详见 position 配置 
//   "offsetX": option<float>,// 图例 x 方向的偏移。 
//   "offsetY": option<float>,// 图例 y 方向的偏移。 
//   "background": option<background>,// 背景框配置项。详见 background 配置 
//   "flipPage": option<bool>,// 当图例项过多时是否进行分页。 分类图例
//   "pageNavigator": option<pageNavigator>,// 分页器的主题样式设置。 分类图例
//   "itemWidth": option<float>,// 图例项的宽度, 默认为 null（自动计算）。 分类图例
//   "itemHeight": option<float>,// 图例的高度, 默认为 null。 分类图例
//   "itemName": option<object>,// 图例项 name 文本的配置。详见 itemName 配置 分类图例
//   "itemValue": option<object>,// 图例项 value 附加值的配置项。详见 itemValue 配置。 分类图例
//   "itemSpacing": option<float>,// 控制图例项水平方向的间距 分类图例
//   "marker": option<object>,// 图例项的 marker 图标的配置。 分类图例
//   "maxWidth": option<float>,// 图例项最大宽度设置。 分类图例
//   "maxHeight": option<float>,// 图例项最大高度设置。 分类图例
//   "reversed": option<bool>,// 是否将图例项逆序展示。 分类图例
//   "custom": option<bool>,// 是否为自定义图例，当该属性为 true 时，需要声明 items 属性。 分类图例
//   "items": object[],// 用户自己配置图例项的内容。详见 items 配置 分类图例
//   "min": option<float>,// 范围的最小值。 连续图例
//   "max": option<float>,// 选择范围的最大值。 连续图例
//   "label": option<object>,// 文本的配置项。详见 label 配置 连续图例
//   "value": float[],// 选择的值。 连续图例
//   "slidable": option<bool>,// 滑块是否可以滑动。 连续图例
//   "rail": option<object>,// 图例滑轨（背景）的样式配置项。详见 rail 配置 连续图例
//   "track": option<object>,// 选择范围的色块样式配置项。详见 track 配置 连续图例
//   "handler": option<object>,// 滑块的配置项。详见 handler 配置 连续图例
//   "animate": option<bool>,// 是否开启动画开关。 
//   "animateOption": option<object>,// 动画参数配置，当且仅当 animate 属性为 true，即动画开启时生效，详见 animateOption 配置
// }