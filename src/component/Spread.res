// https://reasonml.github.io/reason-react/docs/en/adding-data-props
// 解决无法支持 data-*、aria-* 等 attribute 的问题

@react.component
let make = (~props, ~children) => {
  React.cloneElement(children, props)
}
