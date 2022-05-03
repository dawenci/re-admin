let pageFooter = Emotion.css({
  "height": "64px",
  "lineHeight": "64px",
  "textAlign": "center",
})

let logoFont = Emotion.css({
  "verticalAlign": "middle",
})

let attribution = Emotion.css({
  "verticalAlign": "middle",
  "marginLeft": "10px",
  "fontSize": "0.8rem",
  "color": "#bbb",
  "fontWeight": "300",
})

@react.component
let make = (~className: option<string>=?) => {
  let className = pageFooter ++ " " ++ className->Option.getWithDefault("")

  <footer className={className}>
    <ReRouter.Link action={Locations.home->Location.toString->#Jump} className={logoFont}> {"ReAdmin"->React.string} </ReRouter.Link>
    <span className={attribution}> {"Code & design licensed under MIT."->React.string} </span>
  </footer>
}
