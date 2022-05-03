module Utils = {
  let uniqueId = ref(0)
  let generateUniqueId = () => {
    uniqueId := uniqueId.contents + 1
    `rc-g2-${uniqueId.contents->Int.toString}`
  }
}


@react.component
let make = (
  ~data: 'data,
  ~children: G2_Chart.t => unit,
  ~autoFit: option<bool>=?,
  ~width: option<float>=?,
  ~height: option<float>=?,
  ~padding: option<'padding>=?,
  ~appendPadding: option<'padding>=?,
  ~defaultInteractions: option<'defaultInteractions>=?,
  ~limitInPlot: option<bool>=?,
  ~pixelRatio: option<float>=?,
  ~renderer: option<[#canvas | #svg]>=?,
  ~theme: option<'theme>=?,
  ~visible: option<bool>=?,
) => {
  let domRef = React.useRef(Js.Nullable.null)
  let chart = React.useRef(None)

  React.useLayoutEffect(() => {
    switch chart.current {
    | Some(chart) => G2_Chart.changeData(chart, data)
    | None => ()
    }
    None
  })
  React.useLayoutEffect0(() => {
    let chart_ = G2_Chart.make(
      G2_Chart.ChartCfg.make(
        ~container=domRef.current,
        ~autoFit?,
        ~width?,
        ~height?,
        ~padding?,
        ~appendPadding?,
        ~defaultInteractions?,
        ~limitInPlot?,
        ~pixelRatio?,
        ~renderer?,
        ~theme?,
        ~visible?,
        (),
      ),
    )
    chart.current = Some(chart_)
    G2_Chart.data(chart_, data)->ignore
    children(chart_)
    G2_Chart.render(chart_, false)

    Some(
      () => {
        G2_Chart.destroy(chart_)
      },
    )
  })

  <div ref={ReactDOM.Ref.domRef(domRef)} />
}
