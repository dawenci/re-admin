open Promise

Antd.Space.importStyle
Antd.Button.importStyle
Antd.Input.importStyle

module Style = {
  let authPage = Emotion.css({
    "width": "100%",
    "height": "100%",
    "background": "#f7f7f7",
  })

  let authBox = Emotion.css({
    "boxSizing": "border-box",
    "position": "absolute",
    "top": "0",
    "right": "0",
    "bottom": "0",
    "left": "0",
    "width": "360px",
    "height": "420px",
    "padding": "16px",
    "boxShadow": "0 0 10px rgba(0,0,0,.05)",
    "borderRadius": "3px",
    "margin": "auto",
    "background": "#fff",
  })

  let pageFooter = Emotion.css({
    "position": "absolute",
    "top": "auto",
    "right": "0",
    "bottom": "0",
    "left": "0",
  })

  let brand = Emotion.css({
    "margin": "16px auto 24px",
    "fontFamily": "titillium web,sans-serif",
    "textAlign": "center",
    "fontSize": "32px",
    "color": CssVariable.__color_primary,
  })
}

@react.component
let make = () => {
  let dispatch = GlobalState.Context.useDispatch()
  let setUser = user => dispatch(GlobalState.Store.SetUser(user))
  let (isBusy, setBusy) = React.useState(() => false)
  let (form, _) = Antd.Form.useForm()

  let onFinish = values => {
    let username = values["username"]
    let email = values["email"]
    let password = values["password"]

    if !isBusy {
      setBusy(_ => true)
      UserApi.register(~username, ~email, ~password)
      ->then(x => {
        switch x {
        | Ok(user: User.t) =>
          setUser(user->AsyncData.complete)
          setBusy(_ => false)
          Dom.Storage2.localStorage->Dom.Storage2.setItem("jwtToken", user.token->Js.Null.getExn)
          Locations.home->Location.toString->ReRouter.push
        | Error(_) => setBusy(_ => false)
        }
        resolve()
      })
      ->ignore
    }
  }

  <div className={Style.authPage}>
    <div className={Style.authBox}>
      <h1 className={Style.brand}> {"ReAdmin"->React.string} </h1>
      <Antd.Form form={form} onFinish={onFinish}>
        <Antd.Form.Item name="username">
          <Antd.Input placeholder="Your Name" disabled={isBusy} size={#large} />
        </Antd.Form.Item>
        <Antd.Form.Item name="email">
          <Antd.Input placeholder="Email" disabled={isBusy} size={#large} />
        </Antd.Form.Item>
        <Antd.Form.Item name="password">
          <Antd.Input.Password placeholder="Password" disabled={isBusy} size={#large} />
        </Antd.Form.Item>
        <Antd.Button
          _type={#primary} disabled={isBusy} block={true} size={#large} htmlType={#submit}>
          {`注册`->React.string}
        </Antd.Button>
        <p className="text-center" style={ReactDOM.Style.make(~marginTop="16px", ())}>
          <ReRouter.Link action={Locations.login->Location.toString->#Jump}>
            {`已有账号？`->React.string}
          </ReRouter.Link>
        </p>
      </Antd.Form>
    </div>
    <PageFooter className={Style.pageFooter} />
  </div>
}

let default = make
