%%raw(`import("../bindings/ReactQuill/style.css")`)
ReactQuill.importTheme

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
  let (value, setValue) = React.useState(() => `<h1>富文本编辑器</h1><p>本页面使用的是 react-quill 编辑器</p>`)

  <div className={Styles.richTextEditorPage}>
    <ReactQuill
      value={value}
      onChange={setValue}
      style={ReactDOM.Style.make(~height="100%", ())}
      theme="snow"
      formats=["header", "bold", "italic", "underline", "strike", "blockquote", "list", "bullet", "indent", "link", "image"]
      modules={
        "toolbar": (
          [{ "header": (1, 2, false) }],
          ["bold", "italic", "underline", "strike", "blockquote"],
          ({"list": "ordered"}, {"list": "bullet"}, {"indent": "-1"}, {"indent": "+1"}),
          ["link", "image"],
          ["clean"]
        )
      }
      />
  </div>
}
