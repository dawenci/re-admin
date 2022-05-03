module Styles = {
  let pageHeader = Emotion.css({
    "height": "50px",
    "lineHeight": "50px",
    "padding": "0 16px",
    "background": "#fff",
    "boxShadow": "0 0 5px rgba(0,0,0,.05)",
    "&:after": {
      "display": "table",
      "clear": "both",
      "content": `" "`,
    },
  })

  let nav = Emotion.css({
    "float": "right",
    "height": "100%",
  })

  let navItem = Emotion.css({
    "display": "inline-block",
    "marginLeft": "24px",
  })
}

@react.component
let make = (~className: option<string>=?, ~style: option<ReactDOM.Style.t>=?) => {
  let state = GlobalState.Context.useState()
  let user = state.user->AsyncData.toOption
  let avatar = switch user {
  | Some(data) => data.image->Js.Null.toOption->Option.getWithDefault("")
  | None => ""
  }

  let currentUser = user->Option.getWithDefault(User.empty)

  <header
    className={switch className {
    | Some(className) => Styles.pageHeader ++ " " ++ className
    | None => Styles.pageHeader
    }}
    ?style>
    <Breadcrumb style={ReactDOM.Style.make(~float="left", ~height="100%", ())}>
      <Breadcrumb.Item>
        <ReRouter.Link action={Locations.home->Location.toString->#Jump}>
          {`首页`->React.string}
        </ReRouter.Link>
      </Breadcrumb.Item>
      <Breadcrumb.Item last={true}>
        <ReRouter.Link action={#Fn(ignore)}> {`内页`->React.string} </ReRouter.Link>
      </Breadcrumb.Item>
    </Breadcrumb>
    <nav className={Styles.nav}>
      <ul>
        <li className={Styles.navItem}>
          <ReRouter.Link
            className="nav-link active" action={Locations.home->Location.toString->#Jump}>
            <AntdIcon.QuestionCircleOutlined className="f1" />
          </ReRouter.Link>
        </li>
        <AccessControl.AnonymousOnly>
          <li className={Styles.navItem}>
            <ReRouter.Link action={Locations.login->Location.toString->#Jump}>
              {"登录"->React.string}
            </ReRouter.Link>
          </li>
          <li className={Styles.navItem}>
            <ReRouter.Link action={Locations.register->Location.toString->#Jump}>
              {"注册"->React.string}
            </ReRouter.Link>
          </li>
        </AccessControl.AnonymousOnly>
        <AccessControl.AuthenticatedOnly>
          <li className={Styles.navItem}>
            <ReRouter.Link action={Locations.home->Location.toString->#Jump}>
              <SvgIcons.Notification
                fill={CssVariable.__color_primary} width="14px" height="14px"
              />
            </ReRouter.Link>
          </li>
          <li className={Styles.navItem}>
            <ReRouter.Link action={Locations.settings->Location.toString->#Jump}>
              <Avatar src={avatar} style={ReactDOM.Style.make(~width="14px", ~height="14px", ())} />
              {` ${currentUser.nickname}`->React.string}
            </ReRouter.Link>
          </li>
        </AccessControl.AuthenticatedOnly>
        <li className={Styles.navItem}>
          <ReRouter.Link
            className="nav-link active" action={Locations.home->Location.toString->#Jump}>
            <SvgIcons.Language fill={CssVariable.__color_primary} width="14px" height="14px" />
            {` 中文`->React.string}
          </ReRouter.Link>
        </li>
      </ul>
    </nav>
  </header>
}
