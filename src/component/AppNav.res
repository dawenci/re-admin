Antd.Menu.importStyle

let com = Emotion.css({
  "width": "100%",
  "height": "100%",
})

@react.component
let make = (~mode: option<[#vertical | #horizontal | #inline]>=?) => {
  let (selectedKeys, setSelectKeys) = React.useState(() => [])

  let handleClick = React.useCallback0(event => {
    let keyPath = event["keyPath"]
    setSelectKeys(_ => keyPath)
  })

  <div className={com}>
    <Antd.Menu
      ?mode
      selectedKeys={selectedKeys}
      defaultSelectedKeys={["Dashboard"]}
      onClick={handleClick}
      style={ReactDOM.Style.make(~height="100%", ())}>
      {AppRouteConfig.toMenu(AppRoute.routes)}
    </Antd.Menu>
  </div>
}
