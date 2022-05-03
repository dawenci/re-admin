Antd.Button.importStyle
Antd.Card.importStyle
Antd.Statistic.importStyle
Antd.Row.importStyle
Antd.Col.importStyle

module Styles = {
  let page = Emotion.css({
    "boxSizing": "border-box",
    "overflow": "auto",
    "width": "100%",
    "padding": "16px",
  })
}

@react.component
let make = () => {
  <div className={Styles.page}>
    
  </div>
}

let default = make
