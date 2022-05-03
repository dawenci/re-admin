%%raw(`import './styles/app.css'`)
%%raw(`import 'antd/es/style/index.less'`)
@module external styles: {..} = "./App.module.css"
module Css = {
  open CssVariable
  Emotion.injectGlobal(
    `
  a {
    text-decoration: none;
  }
  a:link {
    color: ${__color_primary};
  }
  a:visited {
    color: ${__color_primary};
  }
  a:hover {
    color: ${__color_primary_light};
  }
  a:active {
    color: ${__color_primary_dark};
  }
  `,
  )
}
module DashboardPage = {
  @react.component
  let make = Loadable.loadable(_ => ESImport.dynamic("./page/DashboardPage.bs.js"))
}
module IconsPage = {
  @react.component
  let make = Loadable.loadable(_ => ESImport.dynamic("./page/IconsPage.bs.js"))
}
@react.component
let make = () => {
  <GlobalState.Context.Provider>
    <ReRouter mode={#Hash}>
      <ReRouter.Switch>
        {AppRouteConfig.toRoute(AppRoute.routes)}
      </ReRouter.Switch>
    </ReRouter>
  </GlobalState.Context.Provider>
}

// ReFetch_Test.test()
