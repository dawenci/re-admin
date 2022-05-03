let com = Emotion.css({
  "width": "50px",
  "height": "44px",
  "lineHeight": "44px",
  "overflow": "hidden",
  "fontSize": "1rem",
  "textAlign": "center",
})

@react.component
let make = (
  ~className: option<string>=?,
  ~style: option<ReactDOM.Style.t>=?,
  ~onClick: option<ReactEvent.Mouse.t => unit>=?,
) => {
  let state = GlobalState.Context.useState()
  let collapsed = state.side.collapsed
  <h1
    className={com ++ (Option.isSome(className) ? ` ${Option.getExn(className)}` : "")}
    ?onClick
    ?style>
    {collapsed ? <AntdIcon.MenuUnfoldOutlined /> : <AntdIcon.MenuFoldOutlined />}
  </h1>
}
