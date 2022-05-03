let defaultAvatar = "/img/user.svg"

@react.component
let make = (~src: option<string>=?, ~round=true, ~className="", ~style: option<ReactDOM.Style.t>=?) => {
  // let styles = ReactDOM.Style.make(
  //   ~overflow="hidden",
  //   ~display="inline-block",
  //   ~fill=CssVariable.__color_primary,
  //   ~width=size,
  //   ~height=size,
  //   ~lineHeight=size,
  //   ~borderRadius=round ? "50%" : "0",
  //   (),
  // )

  round->ignore

  let classes = ["re-avatar"]
  if className != "" { classes->Js.Array2.push(className)->ignore }

  <div className={classes->Js.Array2.joinWith(" ")} ?style>
    {src->Option.getWithDefault("") == ""
      ? <SvgIcons.User
        className="re-avatar__svg"
        style={ReactDOM.Style.make(~display="block", ~width="100%", ~height="100%", ())} />
      : <img
          className="re-avatar__img"
          src={src->Option.getExn}
          alt="avatar"
          style={ReactDOM.Style.make(~display="block", ~width="100%", ~height="100%", ())}
        />}
  </div>
}

module Css = {
  open CssVariable
  Emotion.injectGlobal(
    `
.re-avatar {
  fill: ${__color_primary};
  overflow: hidden;
  display: inline-block;
  width: 32px;
  height: 32px;
  lineHeight: 32px;
}
.re-avatar__svg {
  fill: inherit;
}
    `
  )
}
