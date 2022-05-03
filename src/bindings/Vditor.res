type t

@module("vditor") @new
external make: (string, 'options) => t = "default"

// exportJSON(markdown: string)
@send external exportJSON: (t, string) => string = "exportJSON"
@send external getValue: t => string = "getValue"
@send external getHTML: t => string = "getHTML"
@send external insertValue: (t, string) => unit = "insertValue"
@send external _insertValueWithoutRender: (t, string, bool) => unit = "insertValue"
let insertValueWithoutRender: (t, string) => unit = (vditor, value) => {
  _insertValueWithoutRender(vditor, value, false)
}
@send external focus: t => unit = "focus"
@send external blur: t => unit = "blur"
@send external disabled: t => unit = "disabled"
@send external enable: t => unit = "enable"

@send external getSelection: t => string = "getSelection"

// setValue: (markdown, clearStack)
@send external setValue: (t, string) => unit = "setValue"
@send external _setValueAndClearStack: (t, string, bool) => unit = "setValue"
let setValueAndClearStack: (t, string) => unit = (vditor, value) => {
  _insertValueWithoutRender(vditor, value, true)
}

@send external clearStack: t => unit = "clearStack"

@send external renderPreview: t => unit = "renderPreview"
@send external renderPreviewByValue: (t, string) => unit = "renderPreview"

type position = {top: float, left: float}
@send external getCursorPosition: t => position = "getCursorPosition"

@send external deleteValue: t => unit = "deleteValue"

@send external updateValue: (t, string) => unit = "updateValue"

@send external isUploading: t => bool = "isUploading"

@send external clearCache: t => unit = "clearCache"
@send external disabledCache: t => unit = "disabledCache"
@send external enableCache: t => unit = "enableCache"

@send external html2md: (t, string) => string = "html2md"

@send external tip: (t, string, float) => unit = "tip"

@send external setPreviewMode: (t, [#both | #editor]) => unit = "setPreviewMode"

@send
external setTheme: (
  t,
  [#dark | #classic],
  ~contentTheme: string=?,
  ~codeTheme: string=?,
  ~contentThemePath: string=?,
  unit,
) => unit = "setTheme"

@send external getCurrentMode: t => string = "getCurrentMode"

@send external destroy: t => unit = "destroy"

type commentId = {id: string, top: int}
@send external getCommentIds: t => array<commentId> = "getCommentIds"

@send external hlCommentIds: (t, array<string>) => unit = "hlCommentIds"
@send external unHlCommentIds: (t, array<string>) => unit = "unHlCommentIds"
@send external removeCommentIds: (t, array<string>) => unit = "removeCommentIds"
