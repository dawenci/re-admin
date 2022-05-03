open Promise

Antd.Button.importStyle
Antd.Card.importStyle
Antd.Statistic.importStyle
Antd.Row.importStyle
Antd.Col.importStyle

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
  let (conversion, setConversion) = React.useState(() => [])
  let (orders, setOrders) = React.useState(() => [])
  let loadChart = React.useCallback0((load, set) => {
    load()
    ->then(data => {
      switch data {
      | Ok(data) => set(_ => data)
      | Error(_) => ()
      }
      resolve()
    })
    ->catch(exn => {
      Js.log(exn)
      resolve()
    })
    ->ignore
  })

  React.useEffect0(() => {
    loadChart(ChartDemoApi.Conversion.load, setConversion)
    loadChart(ChartDemoApi.Order.load, setOrders)

    None
  })

  let shape = G2.Shape.RegisterShape.make(
    ~draw=@this (shape, cfg, container) => {
      open G2.Shape
      // Js.log4("Register shape", shape, cfg, container)
      let group = IGroup.addGroup(container)
      let center = G2.Shape.Shape.parsePoint(shape, { x: 0., y: 0. })
      IGroup.addShapeFactory(group, #line, ShapeCfg.unsafeMake({
        "attrs": {
          "x1": center.x,
          "y1": center.y,
          "x2": ShapeInfo.getX(cfg),
          "y2": ShapeInfo.getY(cfg),
          "stroke": ShapeInfo.getColor(cfg),
          "lineWidth": 5.,
          "lineCap": #round,
        }
      }))->ignore
      IGroup.addShapeFactory(group, #circle, ShapeCfg.unsafeMake({
        "attrs": {
          "x": center.x,
          "y": center.y,
          "r": 9.75,
          "stroke": ShapeInfo.getColor(cfg),
          "lineWidth": 4.5,
          "fill": "#fff",
        }
      }))->ignore

      group
    },
    ()
  )
  G2.Shape.registerShape(#point, #pointer, shape)->ignore
  let dashboardData = [{ "value": 5.6 }]

  <div className={Styles.page ++ " DashboardPage"}>
    <Antd.Row gutter={[16, 16]} style={ReactDOM.Style.make(~marginBottom="16px", ())}>
      <Antd.Col span={12} lg={{"span": 6}}>
        <Antd.Card style={ReactDOM.Style.make(~height="100%", ())}>
          <Antd.Statistic
            valueStyle={ReactDOM.Style.make(~color={CssVariable.__color_primary}, ())}
            title={`转化率`->React.string}
            prefix={<AntdIcon.PercentageOutlined />}
            value={"4.7"}
          />
          <G2Chart height={40.} data={conversion} autoFit=true>
          {chart => {
            chart
            ->G2.Chart.axisToggle(false)
            ->G2.Chart.tooltipOption({ "showMarkers": false })
            ->G2.Chart.area()
            ->G2.Geometry.positionField("month*value")
            ->G2.Geometry.shapeValue(#smooth)
            ->ignore
            chart
            ->G2.Chart.path()
            ->G2.Geometry.positionField("month*value")
            ->G2.Geometry.shapeValue(#smooth)
            ->ignore
          }}
          </G2Chart>
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={12} lg={{"span": 6}}>
        <Antd.Card style={ReactDOM.Style.make(~height="100%", ())}>
          <Antd.Statistic
            valueStyle={ReactDOM.Style.make(~color={CssVariable.__color_primary}, ())}
            title={`新客户`->React.string}
            prefix={<AntdIcon.UserOutlined />}
            value={805}
          />
          <G2Chart height={40.} data={orders} autoFit=true>
          {chart => {
            open G2.Geometry
            chart
            ->G2.Chart.axisToggle(false)
            ->G2.Chart.tooltipOption({ "showMarkers": false })
            ->ignore
            G2.Chart.interval(chart, ())
            ->positionField("month*value")
            ->ignore
          }}
          </G2Chart>
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={12} lg={{"span": 6}}>
        <Antd.Card style={ReactDOM.Style.make(~height="100%", ())}>
          <Antd.Statistic
            valueStyle={ReactDOM.Style.make(~color={CssVariable.__color_primary}, ())}
            title={`订单数量`->React.string}
            prefix={<AntdIcon.ShoppingCartOutlined />}
            value={1893}
          />
          <G2Chart height={40.} data={orders} autoFit=true>
          {chart => {
            open G2.Geometry
            chart
            ->G2.Chart.axisToggle(false)
            ->G2.Chart.tooltipOption({ "showMarkers": false })
            ->ignore
            G2.Chart.area(chart, ())
            ->positionField("month*value")
            ->shapeValue(#smooth)
            ->ignore
            G2.Chart.path(chart, ())
            ->positionField("month*value")
            ->shapeValue(#smooth)
            ->ignore
          }}
          </G2Chart>
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={12} lg={{"span": 6}}>
        <Antd.Card style={ReactDOM.Style.make(~height="100%", ())}>
          <Antd.Statistic
            valueStyle={ReactDOM.Style.make(~color={CssVariable.__color_primary}, ())}
            title={`销售额`->React.string}
            prefix={<AntdIcon.PayCircleOutlined />}
            value={112893}
          />
          <G2Chart height={40.} data={orders} autoFit=true>
          {chart => {
            open G2.Geometry
            chart
            ->G2.Chart.axisToggle(false)
            ->G2.Chart.tooltipOption({ "showMarkers": false })
            ->ignore
            G2.Chart.interval(chart, ())
            ->positionField("month*value")
            ->ignore
          }}
          </G2Chart>
        </Antd.Card>
      </Antd.Col>
    </Antd.Row>
    <Antd.Row gutter={[16, 16]} style={ReactDOM.Style.make(~marginBottom="16px", ())}>
      <Antd.Col span={24}>
        <Antd.Card title={`年度销售情况`->React.string}>
          <G2Chart height={280.} data={[
            {"month": `1月`, "value": 20250},
            {"month": `2月`, "value": 28302},
            {"month": `3月`, "value": 30203},
            {"month": `4月`, "value": 35806},
            {"month": `5月`, "value": 40283},
            {"month": `6月`, "value": 78023},
            {"month": `7月`, "value": 55021},
            {"month": `8月`, "value": 62503},
            {"month": `9月`, "value": 70222},
            {"month": `10月`, "value": 81203},
            {"month": `11月`, "value": 125810},
            {"month": `12月`, "value": 70280},
          ]}
          autoFit=true>
          {chart => {
            open G2.Geometry
            chart
            ->G2.Chart.axisFieldOption("value", G2.Axis.AxisOption.unsafeMake({
              "grid": {
                "line": {
                  "style": G2.ShapeAttrs.make(
                    ~stroke=Js.Nullable.return("#eee"),
                    ()
                  )
                }
              }
            }))
            ->G2.Chart.tooltipOption({ "showMarkers": false })
            ->ignore
            G2.Chart.interval(chart, ())
            ->positionField("month*value")
            ->ignore
          }}
          </G2Chart>

          {`年度销售情况`->React.string}
        </Antd.Card>
      </Antd.Col>
    </Antd.Row>
    <Antd.Row gutter={[16, 16]} style={ReactDOM.Style.make(~marginBottom="16px", ())}>
      <Antd.Col span={12}>
        <Antd.Card>
          <G2Chart
            height={250.}
            data={[
              {"product": `苹果`, "value": 3.},
              {"product": `梨子`, "value": 4.},
              {"product": `香蕉`, "value": 3.5},
              {"product": `芒果`, "value": 5.},
              {"product": `橙子`, "value": 4.9},
              {"product": `桃子`, "value": 3.},
              {"product": `葡萄`, "value": 4.},
              {"product": `西瓜`, "value": 3.5},
              {"product": `哈密瓜`, "value": 5.},
              {"product": `其他`, "value": 4.9},
            ]}
            autoFit=true>
            {chart => {
              open G2.Geometry
              G2.Chart.coordinateOption(chart, G2.Coordinate.CoordinateOption.t(~_type=#theta, ()))->ignore
              G2.Chart.interval(chart, ())
              ->adjustType(#stack)
              ->positionField("value")
              ->colorField("product")
              ->ignore
            }}
          </G2Chart>

          {`销售额占比`->React.string}
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={12}>
        <Antd.Card>
          // 仪表盘
          <G2Chart data={dashboardData} autoFit={true} height={250.} padding={[0., 0., 16., 0.]}>
          {chart => {
            open G2.Scale
            // sacle
            chart
            ->G2.Chart.scaleFieldOption("value", ScaleOption.t(
              ~min=ScaleOption.min(0),
              ~max=ScaleOption.max(9),
              ()
            ))
            // coodinate
            ->G2.Chart.coordinateTypeConfig(#polar, G2.Coordinate.CoordinateCfg.t(
              ~startAngle=(-9. /. 8.) *. Js.Math._PI,
              ~endAngle=(1. /. 8.) *. Js.Math._PI,
              ~radius=0.75,
              ()
            ))
            ->ignore
            // axis
            chart
            ->G2.Chart.axisFieldToggle("1", false)
            ->G2.Chart.axisFieldOption("value", G2.Axis.AxisOption.t(
              ~line=Js.Nullable.null,
              ~grid=Js.Nullable.null,
              ~label=Js.Nullable.return(G2.Axis.AxisLabelCfg.t(
                ~offset=-36.,
                ~style=G2.ShapeAttrs.make(
                  ~fontSize=14,
                  ~textAlign=#center,
                  ~textBaseline=#middle,
                  ()
                ),
                ()
              )),
              ~tickLine=Js.Nullable.return(G2.Axis.AxisTickLineCfg.t(
                ~length=-24.,
                ()
              )),
              ~subTickLine=Js.Nullable.return(G2.Axis.AxisSubTickLineCfg.t(
                ~count=4,
                ~length=-15.,
                ()
              )),
              ()
            ))
            ->G2.Chart.legendToggle(false)
            ->ignore

            // 自定义指针
            chart
            ->G2.Chart.point()
            ->G2.Geometry.positionField("value*1")
            ->G2.Geometry.shapeValue(#pointer)
            ->G2.Geometry.colorValue("#1890FF")
            ->G2.Geometry.animateOption(G2.Animate.AnimateOption.t(
              ~appear=Js.Nullable.return(G2.Animate.AnimateCfg.t(
                ~animation="fade-in",
                ()
              )),
              ()
            ))
            ->ignore

            // 灰色背景弧线
            open G2.Annotation
            chart
            ->G2.Chart.annotation
            ->AnnotationController.arc(AnnotationOption.t(
              ~top=false,
              ~start=AnnotationOption.annotationPosition([0, 1]),
              ~end=AnnotationOption.annotationPosition([9, 1]),
              ~style=G2.ShapeAttrs.make(
                ~stroke=Js.Nullable.return("#CBCBCB"),
                ~lineWidth=18.,
                ~lineDash=Js.Nullable.null,
                ()
              ),
              ()
            ))
            // 高亮当前值弧线
            ->AnnotationController.arc(AnnotationOption.t(
              ~start=AnnotationOption.annotationPosition([0, 1]),
              ~end=AnnotationOption.annotationPosition([Js.Array2.unsafe_get(dashboardData, 0)["value"], 1.]),
              ~style=G2.ShapeAttrs.make(
                ~stroke=Js.Nullable.return("#1890FF"),
                ~lineWidth=18.,
                ~lineDash=Js.Nullable.null,
                ()
              ),
              ()
            ))
            // 指标名称
            ->AnnotationController.text(AnnotationOption.t(
              ~position=AnnotationOption.annotationPosition(["50%", "85%"]),
              ~content=AnnotationOption.content(`合格率`),
              ~style=G2.ShapeAttrs.make(
                ~fill=Js.Nullable.return("#545454"),
                ~fontSize=16,
                ~textAlign=#center,
                ()
              ),
              ()
            ))
            // 百分比数字
            ->AnnotationController.text(AnnotationOption.t(
              ~position=AnnotationOption.annotationPosition(["50%", "90%"]),
              ~content=AnnotationOption.content(`${(Js.Array2.unsafe_get(dashboardData, 0)["value"] *. 10.)->Float.toString} %`),
              ~style=G2.ShapeAttrs.make(
                ~fill=Js.Nullable.return("#545454"),
                ~fontSize=24,
                ~textAlign=#center,
                ()
              ),
              ~offsetY=15.,
              ()
            ))
            ->ignore
          }}
          </G2Chart>
          // <BizCharts.Plots.GaugeChart percent=0.732 />
          {`销售目标达成情况`->React.string}
        </Antd.Card>
      </Antd.Col>
    </Antd.Row>
  </div>
}

let default = make
