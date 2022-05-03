module LoginPage = {
  @react.component
  let make = Loadable.loadable(_ => ESImport.dynamic("../page/LoginPage.bs.js"))
}

module RegisterPage = {
  @react.component
  let make = Loadable.loadable(_ => ESImport.dynamic("../page/RegisterPage.bs.js"))
}

module Layout = {
  type props = {"children": option<React.element>}
  @obj external makeProps: (~children: React.element=?, unit) => props = ""
  let make: React.component<props> = Loadable.loadable(_ =>
    ESImport.dynamic("../component/Layout.bs.js")
  )
}

module DashboardPage = {
  @react.component
  let make = Loadable.loadable(_ => ESImport.dynamic("../page/DashboardPage.bs.js"))
}

module IconsPage = {
  @react.component
  let make = Loadable.loadable(_ => ESImport.dynamic("../page/IconsPage.bs.js"))
}

let routes = [
  AppRouteConfig.make(
    ~path="/",
    ~exact=true,
    ~title=() => `Dashboard`->React.string,
    ~icon=() => <AntdIcon.DashboardOutlined />,
    ~component=() =>
      <AccessControl.AuthenticatedOnly>
        <Layout> <DashboardPage /> </Layout>
      </AccessControl.AuthenticatedOnly>,
    (),
  ),
  AppRouteConfig.make(~path="/login", ~hidden=true, ~component=() => <LoginPage />, ()),
  AppRouteConfig.make(~path="/register", ~hidden=true, ~component=() => <RegisterPage />, ()),
  AppRouteConfig.make(
    ~path="/icons",
    ~title=() => `Antd 图标`->React.string,
    ~icon=()=><AntdIcon.CoffeeOutlined />,
    ~component=() =>
      <AccessControl.AuthenticatedOnly>
        <Layout> <IconsPage /> </Layout>
      </AccessControl.AuthenticatedOnly>,
    (),
  ),
  AppRouteConfig.make(
    ~path="/charts",
    ~title=() => `图表`->React.string,
    ~icon=() => <AntdIcon.PieChartOutlined />,
    ~children=[
      AppRouteConfig.make(
        ~path="/charts/g2",
        ~title=() => `BizCharts`->React.string,
        ~component=() =>
          <AccessControl.AuthenticatedOnly>
            <Layout> <BizChartsPlotsPage /> </Layout>
          </AccessControl.AuthenticatedOnly>,
        (),
      ),
      AppRouteConfig.make(
        ~path="/charts/plots",
        ~title=() => `BizCharts.Plots`->React.string,
        ~component=() =>
          <AccessControl.AuthenticatedOnly>
            <Layout> <BizChartsPlotsPage /> </Layout>
          </AccessControl.AuthenticatedOnly>,
        (),
      ),
    ],
    (),
  ),
  AppRouteConfig.make(
    ~path="/form",
    ~title=() => `表单`->React.string,
    ~icon=()=><AntdIcon.ProfileOutlined />,
    ~component=() =>
      <AccessControl.AuthenticatedOnly>
        <Layout> <FormPage /> </Layout>
      </AccessControl.AuthenticatedOnly>,
    (),
  ),
  AppRouteConfig.make(
    ~path="/editor",
    ~title=() => `编辑器`->React.string,
    ~icon=()=><AntdIcon.EditOutlined />,
    ~children=[
      AppRouteConfig.make(
        ~path="/editor/rich",
        ~title=() => `富文本`->React.string,
        ~component=() =>
          <AccessControl.AuthenticatedOnly>
            <Layout> <RichTextEditorPage /> </Layout>
          </AccessControl.AuthenticatedOnly>,
        (),
      ),
      AppRouteConfig.make(
        ~path="/editor/markdown",
        ~title=() => `markdown`->React.string,
        ~component=() =>
          <AccessControl.AuthenticatedOnly>
            <Layout> <MarkdownEditorPage /> </Layout>
          </AccessControl.AuthenticatedOnly>,
        (),
      ),
    ],
    (),
  ),
  AppRouteConfig.make(
    ~path="/excel",
    ~title=() => `Excel 导入导出`->React.string,
    ~icon=()=><AntdIcon.FileExcelOutlined />,
    ~component=() =>
      <AccessControl.AuthenticatedOnly>
        <Layout> <ExcelPage /> </Layout>
      </AccessControl.AuthenticatedOnly>,
    (),
  ),
  AppRouteConfig.make(
    ~path="/list",
    ~title=() => `列表页`->React.string,
    ~icon=()=><AntdIcon.TableOutlined />,
    ~children=[
      AppRouteConfig.make(
        ~path="/list/table",
        ~title=() => `用户管理`->React.string,
        ~component=() =>
          <AccessControl.AuthenticatedOnly>
            <Layout> <TablePage /> </Layout>
          </AccessControl.AuthenticatedOnly>,
        (),
      ),
    ],
    (),
  ),
  AppRouteConfig.make(
    ~path="/knowledge",
    ~title=() => `知识库`->React.string,
    ~icon=()=><AntdIcon.ReadOutlined />,
    ~component=() =>
      <AccessControl.AuthenticatedOnly>
        <Layout> <KnowledgePage /> </Layout>
      </AccessControl.AuthenticatedOnly>,
    (),
  ),
  AppRouteConfig.make(
    ~path="/access",
    ~title=() => `访问控制`->React.string,
    ~icon=()=><AntdIcon.SafetyOutlined />,
    ~component=() =>
      <AccessControl.AuthenticatedOnly>
        <Layout>
          <AccessControl.ByRole role="admin"> <AccessControlPage /> </AccessControl.ByRole>
        </Layout>
      </AccessControl.AuthenticatedOnly>,
    (),
  ),
  AppRouteConfig.make(
    ~path="/settings",
    ~hidden=true,
    ~component=() =>
      <AccessControl.AuthenticatedOnly>
        <Layout> <SettingsPage /> </Layout>
      </AccessControl.AuthenticatedOnly>,
    (),
  ),
  AppRouteConfig.make(~path="/500", ~component=() => <Layout> <Error500 /> </Layout>, ()),
  AppRouteConfig.make(~path="/403", ~component=() => <Layout> <Error403 /> </Layout>, ()),
  AppRouteConfig.make(~path="(.*)", ~component=() => <Layout> <Error404 /> </Layout>, ()),
]
