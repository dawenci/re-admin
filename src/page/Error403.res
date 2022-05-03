module Styles = {
  let errorPage = Emotion.css({
    "boxSizing": "border-box",
    "position": "relative",
    "height": "calc(100vh - 98px)",
    "margin": "24px",
    "backgroundColor": "#fff",
  })

  let sub = Emotion.css({
    "boxSizing": "content-box",
    "position": "absolute",
    "top": "0",
    "right": "auto",
    "bottom": "50px",
    "left": "0",
    "width": "calc(50% - 16px)",
    "height": "200px",
    "margin": "auto",
    "color": "#aaa",
  })
  let fontErrorCode = Emotion.css({
    "fontSize": "96px",
    "lineHeight": "140px",
    "textAlign": "right",
  })
  let fontDetail = Emotion.css({
    "fontSize": "30px",
    "lineHeight": "40px",
    "textAlign": "right",
  })

  let main = Emotion.css({
    "boxSizing": "content-box",
    "position": "absolute",
    "top": "0",
    "right": "0",
    "bottom": "50px",
    "left": "auto",
    "width": "calc(50% - 16px)",
    "height": "200px",
    "lineHeight": "120px",
    "margin": "auto",
    "color": "#aaa",
  })
}

@react.component
let make = () => {
  <div className={Styles.errorPage}>
    <div className={Styles.sub}>
      <div className={Styles.fontErrorCode}>{`403`->React.string}</div>
      <div className={Styles.fontDetail}>{`无访问权限` -> React.string}</div>
    </div>
    <div className={Styles.main}>
      <ReRouter.Link action={#Jump("/")}>
        <Antd.Button _type={#primary} size={#large}>{`返回首页`->React.string}</Antd.Button>
      </ReRouter.Link>
    </div>
  </div>
}
