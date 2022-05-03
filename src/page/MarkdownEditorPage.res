%%raw(`import("../styles/vditor.css")`)

module Styles = {
  let richTextEditorPage = Emotion.css({
    "boxSizing": "border-box",
    "display": "flex",
    "flexFlow": "column nowrap",
    "position": "relative",
    "height": "calc(100vh - 98px)",
    "margin": "24px",
    "backgroundColor": "#fff",
  })
}

@react.component
let make = () => {
  let vditorRef = React.useRef(None)

  let onVditorReader = () => {
    switch vditorRef.current {
    | Some(vditor) =>
      Vditor.setValue(vditor, `# Markdown 编辑器\n本页面使用的是 Vditor 编辑器`)
    | None => ()
    }
  }

  let options = {
    "width": "100%",
    "cache": {
      "enable": false,
    },
    "mode": "ir",
    "cdn": "/vditor",
    "emojiPath": "/vditor",
    "preview": {
      "theme": {
        "path": "/vditor/dist/css/content-theme"
      }
    },
    "resize": {
      "enable": false,
    },
    "after": onVditorReader
  }

  <div className={Styles.richTextEditorPage}>
    <VditorEditor
      style={ReactDOM.Style.make(~height="100%", ())}
      id="markdown"
      options=options
      onBound=(vditor => {
        vditorRef.current = Some(vditor)
      })
    />
  </div>
}
