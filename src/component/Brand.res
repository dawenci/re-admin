let brand = Emotion.css({
  "overflow": "hidden",
  "fontFamily": "titillium web,sans-serif",
  "fontSize": "24px",
  "backgroundColor": CssVariable.__color_primary,
})

@react.component
let make = (~className: option<string>=?) => {
  let state = GlobalState.Context.useState()
  let collapsed = state.side.collapsed

  <div className={brand ++ (Option.isSome(className) ? ` ${Option.getExn(className)}` : "")}>
    <ReRouter.Link style={ReactDOM.Style.make(~color="#fff", ())} action={Locations.home->Location.toString->#Jump}> {(collapsed ? "Re" : "ReAdmin")->React.string} </ReRouter.Link>
  </div>
}
