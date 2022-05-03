Antd.Layout.importStyle

module Styles = {
  let sideHeader = Emotion.css({
    "height": "50px",
    "margin": "0",
    "padding": "0",
    "lineHeight": "50px",
    "textAlign": "center",
    "background": "rgba(0,0,0,.05)",
  })

  let sideNavWrap = Emotion.css({
    "overflowX": "hidden",
    "overflowY": "auto",
    "height": "calc(100vh - 94px)",
  })

  let appPage = Emotion.css({
    "boxSizing": "border-box",
    "width": "100%",
  })
}

module SiderCollapsed = {
  type t = {
    collapsed: bool,
    fold: unit => unit,
    unfold: unit => unit,
    toggle: unit => unit,
  }

  let foldStorage = () => {
    Dom.Storage2.localStorage->Dom.Storage2.setItem("GlobalState.side.collapsed", "")
  }

  let unfoldStorage = () => {
    Dom.Storage2.localStorage->Dom.Storage2.removeItem("GlobalState.side.collapsed")
  }

  let useCollapsed = () => {
    let state = GlobalState.Context.useState()
    let dispatch = GlobalState.Context.useDispatch()
    let collapsed = state.side.collapsed
    let fold = () => {
      dispatch(GlobalState.Store.FoldSide)
      foldStorage()
    }
    let unfold = () => {
      dispatch(GlobalState.Store.UnfoldSide)
      unfoldStorage()
    }
    let toggle = () => {
      if collapsed {
        unfold()
      } else {
        fold()
      }
    }
    {collapsed: collapsed, toggle: toggle, fold: fold, unfold: unfold}
  }
}

@react.component
let make = (~children: option<React.element>=?) => {
  let {collapsed, toggle, fold, unfold} = SiderCollapsed.useCollapsed()

  let onBreakpoint = React.useCallback0(broken => {
    if broken {
      fold()
    } else {
      unfold()
    }
  })

  <Antd.Layout>
    <Antd.Layout.Sider
      theme={#light}
      style={ReactDOM.Style.make(
        ~position="fixed",
        ~left="0",
        ~height="100vh",
        ~overflow="auto",
        (),
      )}
      collapsed={collapsed}
      width={200}
      collapsible={true}
      // 侧栏折叠切换开关
      trigger={<div style={ReactDOM.Style.make(~borderRight="1px solid #f0f0f0", ())}>
        <ToggleSide onClick={_ => toggle()} />
      </div>}
      collapsedWidth={50.}
      breakpoint={#md}
      onBreakpoint={onBreakpoint}>
      // 品牌
      <div className={Styles.sideHeader}> <Brand /> </div>
      // 应用主导航
      <div className={Styles.sideNavWrap}> <AppNav mode={collapsed ? #vertical : #inline} /> </div>
    </Antd.Layout.Sider>
    <Antd.Layout
      style={ReactDOM.Style.make(
        ~transition=".2s margin",
        ~marginLeft=collapsed ? "50px" : "200px",
        ~height="100vh",
        ~overflow="auto",
        (),
      )}>
      <PageHeader />
      <Antd.Layout.Content>
        <div className={Styles.appPage}> {Option.getWithDefault(children, React.null)} </div>

        <PageFooter />
      </Antd.Layout.Content>
    </Antd.Layout>
  </Antd.Layout>
}

let default = make
