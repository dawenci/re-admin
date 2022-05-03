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
  <div className={bizChartsPage}>
    <Antd.Row gutter={[16, 16]}>
      <Antd.Col span={12}>
        <Antd.Card title={`Plots.LineChart`->React.string}>
          <BizCharts.Plots.LineChart
            xField="month"
            yField="value"
            data=[
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
            ]
            lineStyle={BizCharts.Plots.makeLineStyle(
              ~stroke=CssVariable.__color_primary,
              (),
            )}
          />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={12}>
        <Antd.Card title={`Plots.StepLineChart`->React.string}>
          <BizCharts.Plots.StepLineChart
            xField="month"
            yField="value"
            data=[
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
            ]
            lineStyle={BizCharts.Plots.makeLineStyle(
              ~stroke=CssVariable.__color_primary,
              (),
            )}
          />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={12}>
        <Antd.Card title={`Plots.AreaChart`->React.string}>
          <BizCharts.Plots.AreaChart
            xField="month"
            yField="value"
            data=[
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
            ]
            line={BizCharts.Plots.AreaChart.makeLine(
              ~style=BizCharts.Plots.makeLineStyle(
                ~stroke=CssVariable.__color_primary,
                (),
              ),
              (),
            )}
          />
        </Antd.Card>
      </Antd.Col>

      <Antd.Col span={12}>
        <Antd.Card title={`Plots.StackedAreaChart`->React.string}>
          <BizCharts.Plots.StackedAreaChart
            title={{
              "visible": true,
              "text": `堆叠面积图`,
            }}
            isStack=true
            stackField="country"
            color={["#6897a7", "#8bc0d6", "#60d7a7", "#dedede", "#fedca9", "#fab36f", "#d96d6f"]}
            xAxis={{
              "tickCount": 5,
            }}
            legend={{
              "visible": true,
              "position": "right-top",
            }}
            responsive=true
            xField="date"
            yField="value"
            data=[
              { "country": `北美`, "date": 2010, "value": 2720.7 },
              { "country": `北美`, "date": 2011, "value": 2722.9 },
              { "country": `北美`, "date": 2012, "value": 2665.1 },
              { "country": `北美`, "date": 2013, "value": 2738.3 },
              { "country": `北美`, "date": 2014, "value": 2766.8 },
              { "country": `北美`, "date": 2015, "value": 2739.7 },
              { "country": `北美`, "date": 2016, "value": 2761.9 },
              { "country": `北美`, "date": 2017, "value": 2772.8 },
              { "country": `中南美`, "date": 2010, "value": 632.5 },
              { "country": `中南美`, "date": 2011, "value": 658.9 },
              { "country": `中南美`, "date": 2012, "value": 676.5 },
              { "country": `中南美`, "date": 2013, "value": 692. },
              { "country": `中南美`, "date": 2014, "value": 697.7 },
              { "country": `中南美`, "date": 2015, "value": 701.1 },
              { "country": `中南美`, "date": 2016, "value": 696.8 },
              { "country": `中南美`, "date": 2017, "value": 700.6 },
              { "country": `欧洲`, "date": 2010, "value": 2001.1 },
              { "country": `欧洲`, "date": 2011, "value": 1949.1 },
              { "country": `欧洲`, "date": 2012, "value": 1944.3 },
              { "country": `欧洲`, "date": 2013, "value": 1934. },
              { "country": `欧洲`, "date": 2014, "value": 1871.2 },
              { "country": `欧洲`, "date": 2015, "value": 1908.7 },
              { "country": `欧洲`, "date": 2016, "value": 1934.6 },
              { "country": `欧洲`, "date": 2017, "value": 1969.5 },
              { "country": `亚太地区`, "date": 2010, "value": 4696.1 },
              { "country": `亚太地区`, "date": 2011, "value": 4951.1 },
              { "country": `亚太地区`, "date": 2012, "value": 5118.2 },
              { "country": `亚太地区`, "date": 2013, "value": 5269.9 },
              { "country": `亚太地区`, "date": 2014, "value": 5382.9 },
              { "country": `亚太地区`, "date": 2015, "value": 5472.4 },
              { "country": `亚太地区`, "date": 2016, "value": 5585.5 },
              { "country": `亚太地区`, "date": 2017, "value": 5743.6 }
            ]
          />
        </Antd.Card>
      </Antd.Col>
    </Antd.Row>
  </div>
}

let default = make
