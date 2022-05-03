module Item = {
  let com = Emotion.css({
    "boxSizing": "border-box",
    "display": "inline-flex",
    "flexFlow": "row nowrap",
    "alignItems": "center",
    "verticalAlign": "middle",
  })

  let link = Emotion.css({
    "whiteSpace": "nowrap",
    "cursor": "default",
    "textDecoration": "none",
    "&:hover": {
      "textDecoration": "underline",
    },
    "&:active": {
      "textDecoration": "underline",
    },
  })

  let separatorChar = Emotion.css({
    "margin": "0 8px",
    "whiteSpace": "nowrap",
    "userSelect": "none",
    "opacity": ".5",
    "&:empty": {
      "display": "none",
    },
  })

  @react.component
  let make = (~children, ~last=false, ~separator: option<string>=?) => {
    <div className={com ++ (last ? " last" : "")}>
      <span className={link}> {children} </span>
      {last
        ? React.null
        : <div className={separatorChar}>
            {Option.getWithDefault(separator, "/")->React.string}
          </div>}
    </div>
  }
}

let com = Emotion.css({
  "fontSize": "14px",
})

@react.component
let make = (~style, ~children: option<React.element>=?) => {
  <div className={com} style>
    {switch children {
    | Some(el) => el
    | None => React.null
    }}
  </div>
}
