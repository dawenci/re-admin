// @module external styles: {..} = "./UserSetting.module.css"

Antd.Card.importStyle
Antd.Tabs.importStyle
Antd.Avatar.importStyle
Antd.Button.importStyle

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
  let state = GlobalState.Context.useState()
  let dispatch = GlobalState.Context.useDispatch()

  let initUser = switch state.user {
  | AsyncData.Init | AsyncData.Loading => User.empty
  | AsyncData.Complete(user) | AsyncData.Reloading(user) => user
  }

  let (form, setForm) = React.useState(() => initUser)
  let (password, setPassword) = React.useState(() => "")
  let (_error, setError) = React.useState(() => None)
  let (isBusy, setBusy) = React.useState(() => false)

  let handleLogout = event => {
    event->ReactEvent.Mouse.preventDefault
    event->ReactEvent.Mouse.stopPropagation
    if isBusy {
      ignore()
    } else {
      dispatch(GlobalState.Store.DeleteUser)
      Dom.Storage2.localStorage->Dom.Storage2.removeItem("jwtToken")
      Locations.home->Location.toString->ReRouter.push
    }
  }

  let handleSubmit = event => {
    event->ReactEvent.Mouse.preventDefault
    event->ReactEvent.Mouse.stopPropagation
    setBusy(_ => true)
    UserApi.updateUser(~user=form, ~password, ())
    ->Promise.then(res => {
      switch res {
      | Ok(user) =>
        setForm(_ => user)
        setPassword(_ => "")
        setError(_ => None)
        dispatch(GlobalState.Store.SetUser(user->AsyncData.complete))
      | Error(_) =>
        Js.log("Button.UpdateSettings: failed to decode json")
        ignore()
      }
      setBusy(_ => false)
      Promise.resolve()
    })
    ->ignore
  }

  <div className={Styles.page}>
    <Antd.Card style=ReactDOM.Style.make(~marginBottom="16px",~minHeight="100%", ()) >
      <Antd.Tabs tabPosition=#left>
        <Antd.Tabs.TabPane key="1" tab={`基本设置`->React.string}>
          <h2>{`基本设置`->React.string}</h2>
          <Antd.Row>
            <Antd.Col span={12}>
              <Antd.Form
                layout=#vertical
                initialValues=initUser >
                <Antd.Form.Item name="username" label={`用户名` ->React.string}>
                  <Antd.Input
                    placeholder="username"
                    disabled=isBusy
                    // value=form.username
                  />
                </Antd.Form.Item>

                <Antd.Form.Item name="nickname" label={`昵称` ->React.string}>
                  <Antd.Input
                    placeholder="nickname"
                    disabled=isBusy
                    // value=form.username
                  />
                </Antd.Form.Item>


                // <Antd.Form.Item name="bio" label={"bio" ->React.string}>
                //   <Antd.Input.Textarea
                //     rows=8
                //     placeholder="Short bio about you"
                //     disabled=isBusy
                //     // value={form.bio}
                //   />
                // </Antd.Form.Item>

                <Antd.Form.Item name="email" label={"Email" ->React.string}>
                  <Antd.Input
                    placeholder="Email"
                    disabled=isBusy
                    // value=form.email
                  />
                </Antd.Form.Item>

                <Antd.Button className="btn btn-md btn-primary"
                  _type={#primary}
                  htmlType=#submit
                  disabled={isBusy}
                  onClick={handleSubmit}>
                  {`确定修改`->React.string}
                </Antd.Button>
              </Antd.Form>
            </Antd.Col>

            <Antd.Col offset={2} span={10} style=ReactDOM.Style.make(~textAlign="center", ())>
              <div style=ReactDOM.Style.make(~marginBottom="16px", ())>
              {switch Js.Null.toOption(form.image) {
              | None => <Antd.Avatar size={128} icon={<AntdIcon.UserOutlined />} />
              | Some(url) => <Antd.Avatar size={128} src={url} />
              }}
              </div>
              <Antd.Button>{`更换头像`->React.string}</Antd.Button>
            </Antd.Col>
          </Antd.Row>
        </Antd.Tabs.TabPane>

        <Antd.Tabs.TabPane key="2" tab={`安全设置`->React.string}>
          <h2>{`安全设置`->React.string}</h2>
          <Antd.Row style=ReactDOM.Style.make(~marginBottom="32px", ())>
            <Antd.Col span={12}>
              <Antd.Form
                layout=#vertical
                initialValues=initUser >
                <Antd.Form.Item name="password" label={`密码` ->React.string}>
                  <Antd.Input.Password
                    placeholder="password"
                    disabled=isBusy
                  />
                </Antd.Form.Item>

                <Antd.Button className="btn btn-md btn-primary"
                  _type={#primary}
                  htmlType=#submit
                  disabled={isBusy}
                  onClick={handleSubmit}>
                  {`确定修改`->React.string}
                </Antd.Button>
              </Antd.Form>
            </Antd.Col>
          </Antd.Row>

          <Antd.Button
            _type={#primary}
            danger={true}
            disabled={isBusy}
            onClick={handleLogout}>
            {`退出登录`->React.string}
          </Antd.Button>    
        </Antd.Tabs.TabPane>
      </Antd.Tabs>
    </Antd.Card>
  </div>
}
