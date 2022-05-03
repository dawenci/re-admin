// %%raw(`import 'antd/es/button/style/index.less'`)
Antd.Row.importStyle
Antd.Col.importStyle
Antd.Card.importStyle

let bizChartsPage = Emotion.css({
  "boxSizing": "border-box",
  "width": "100%",
  "padding": "16px",
})

@react.component
let make = () => {
  let data = [
    {
      "month": "Jan",
      "city": "Tokyo",
      "temperature": 7.,
    },
    {
      "month": "Jan",
      "city": "London",
      "temperature": 3.9,
    },
    {
      "month": "Feb",
      "city": "Tokyo",
      "temperature": 6.9,
    },
    {
      "month": "Feb",
      "city": "London",
      "temperature": 4.2,
    },
    {
      "month": "Mar",
      "city": "Tokyo",
      "temperature": 9.5,
    },
    {
      "month": "Mar",
      "city": "London",
      "temperature": 5.7,
    },
    {
      "month": "Apr",
      "city": "Tokyo",
      "temperature": 14.5,
    },
    {
      "month": "Apr",
      "city": "London",
      "temperature": 8.5,
    },
    {
      "month": "May",
      "city": "Tokyo",
      "temperature": 18.4,
    },
    {
      "month": "May",
      "city": "London",
      "temperature": 11.9,
    },
    {
      "month": "Jun",
      "city": "Tokyo",
      "temperature": 21.5,
    },
    {
      "month": "Jun",
      "city": "London",
      "temperature": 15.2,
    },
    {
      "month": "Jul",
      "city": "Tokyo",
      "temperature": 25.2,
    },
    {
      "month": "Jul",
      "city": "London",
      "temperature": 17.,
    },
    {
      "month": "Aug",
      "city": "Tokyo",
      "temperature": 26.5,
    },
    {
      "month": "Aug",
      "city": "London",
      "temperature": 16.6,
    },
    {
      "month": "Sep",
      "city": "Tokyo",
      "temperature": 23.3,
    },
    {
      "month": "Sep",
      "city": "London",
      "temperature": 14.2,
    },
    {
      "month": "Oct",
      "city": "Tokyo",
      "temperature": 18.3,
    },
    {
      "month": "Oct",
      "city": "London",
      "temperature": 10.3,
    },
    {
      "month": "Nov",
      "city": "Tokyo",
      "temperature": 13.9,
    },
    {
      "month": "Nov",
      "city": "London",
      "temperature": 6.6,
    },
    {
      "month": "Dec",
      "city": "Tokyo",
      "temperature": 9.6,
    },
    {
      "month": "Dec",
      "city": "London",
      "temperature": 4.8,
    },
  ]

  let sales = Js.Dict.empty()
  sales->Js.Dict.set("city", G2_Scale.ScaleOption.linear(~formatter=G2_Scale.ScaleOption.formatter(v => {
      if v == "London" {
        `伦敦`
      } else {
        `东京`
      }
    }), ()))

  <div className={bizChartsPage}>
    <Antd.Row gutter={[16, 16]}>
      <Antd.Col span={12}>
        <Antd.Card title={`Line`->React.string}>
          <BizCharts.Chart
            height={240.}
            autoFit=true
            data={data}
            interactions={[#"active-region"]}
            padding={#auto}
            // onBeforerender={(a, b) => {Js.log3("onBeforerender", a, b)}}
            // onAfterrender={(a, b) => {Js.log3("onAfterrender", a, b)}}
            // onBeforepaint={(a, b) => {Js.log3("onBeforepaint", a, b)}}
            // onAfterpaint={(a, b) => {Js.log3("onAfterpaint", a, b)}}
            // onBeforechangedata={(a, b) => {Js.log3("onBeforechangedata", a, b)}}
            // onBeforeclear={(a, b) => {Js.log3("onBeforeclear", a, b)}}
            // onAfterclear={(a, b) => {Js.log3("onAfterclear", a, b)}}
            // onBeforedestroy={(a, b) => {Js.log3("onBeforedestroy", a, b)}}
            // onGetG2Instance={g2 => Js.log2("G2 instance:", g2)}
            scale=sales>
            <BizCharts.Point position="month*temperature" color="city" shape=#circle />
            <BizCharts.Line
              shape=#smooth position="month*temperature" color="city" label="temperature"
            />
            <BizCharts.Tooltip shared=true showCrosshairs=true />
          </BizCharts.Chart>
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={12}>
        <Antd.Card title={`Line`->React.string}>
          <BizCharts.Chart height={240.} data={data} autoFit=true>
            <BizCharts.Coordinate _type=#polar />
            <BizCharts.Line position="month*temperature" size="2" />
          </BizCharts.Chart>
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={12}>
        <Antd.Card title={`LineAdvance`->React.string}>
          <BizCharts.Chart height={240.} data={data} autoFit=true>
            <BizCharts.LineAdvance
              shape=#smooth
              position="month*temperature"
              color="city"
              label="temperature"
              point=true
              area=true
            />
          </BizCharts.Chart>
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={12}>
        <Antd.Card title={`Interval`->React.string}>
          <BizCharts.Chart height={240.} data={data} autoFit=true>
            <BizCharts.Tooltip shared=true />
            <BizCharts.Interval
              position="month*temperature"
              color="city"
              adjust={[
                {
                  "type": "dodge",
                  "marginRatio": 0,
                },
              ]}
            />
          </BizCharts.Chart>
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={12}>
        <Antd.Card title={`Interval`->React.string}>
          <BizCharts.Chart height={240.} data={data} autoFit=true>
            <BizCharts.Tooltip shared=true />
            <BizCharts.Coordinate _type=#theta />
            <BizCharts.Interval position="temperature" color="month" />
          </BizCharts.Chart>
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={12}>
        <Antd.Card title={`Interval`->React.string}>
          <BizCharts.Chart height={240.} data={data} autoFit=true>
            <BizCharts.Tooltip shared=true />
            <BizCharts.Coordinate _type=#polar />
            <BizCharts.Interval
              position="temperature" color="month" adjust={[{"type": "dodge", "marginRatio": 1}]}
            />
          </BizCharts.Chart>
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={12}>
        <Antd.Card title={`Point`->React.string}>
          <BizCharts.Chart height={240.} data={data} autoFit=true>
            <BizCharts.Tooltip shared=true />
            <BizCharts.Point
              position="month*temperature"
              color="city"
              size="temperature"
              adjust={[
                {
                  "type": "dodge",
                  "marginRatio": 0,
                },
              ]}
            />
          </BizCharts.Chart>
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={12}>
        <Antd.Card title={`Area`->React.string}>
          <BizCharts.Chart height={240.} data={data} autoFit=true>
            <BizCharts.Tooltip shared=true />
            <BizCharts.Area position="month*temperature" color="city" />
            <BizCharts.Line position="month*temperature" color="city" shape=#smooth />
          </BizCharts.Chart>
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={12}>
        <Antd.Card title={`Path`->React.string}>
          <BizCharts.Chart height={240.} data={data} autoFit=true>
            <BizCharts.Tooltip shared=true />
            <BizCharts.Path position="month*temperature" color="city" shape=#smooth />
          </BizCharts.Chart>
        </Antd.Card>
      </Antd.Col>

      <Antd.Col span={12}>
        <Antd.Card title={`Effects`->React.string}>
          <BizCharts.Chart height={240.} data={data} autoFit=true>
            <BizCharts.Effects>
              {(chart) => {
                module An = G2.Annotation
                module ShapeAttrs = BizCharts.G.ShapeAttrs
                data->Js.Array2.forEach(item => {
                  chart->G2_Chart.annotation
                  ->An.AnnotationController.text(
                    An.AnnotationOption.t(
                      ~position=An.AnnotationOption.annotationPosition((item["month"], item["temperature"])),
                      ~content= An.AnnotationOption.content(`$${item["temperature"]->Js.Float.toString}`),
                      ~style=ShapeAttrs.make(~textAlign=#center, ()),
                      ~offsetY=-12.,
                      ()
                    )
                  )
                  ->An.AnnotationController.text(
                    An.AnnotationOption.t(
                      ~position=An.AnnotationOption.annotationPosition((item["month"], item["temperature"])),
                      ~content= An.AnnotationOption.content(`${
                        (item["temperature"] *. 100.) ->Js.Float.toString}%`
                      ),
                      ~style=ShapeAttrs.make(~textAlign=#center, ()),
                      ~offsetY=-30.,
                      ()
                    )
                  )
                  ->ignore
                })
              }}
            </BizCharts.Effects>
          </BizCharts.Chart>
        </Antd.Card>
      </Antd.Col>


      
    </Antd.Row>
  </div>
}

let default = make
