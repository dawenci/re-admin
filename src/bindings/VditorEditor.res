
@react.component
let make = (
  ~style: option<ReactDOM.Style.t>=?,
  ~className: option<string>=?,
  ~id: string,
  ~options: 'options,
  ~onBound: option<Vditor.t => unit>=?,
) => {
  let id = `vditor-${id}`

  React.useEffect0(() => {
    let vditor = Vditor.make(id, options)

    switch onBound {
    | Some(onBound) => onBound(vditor)
    | None => ()
    }

    None
  })

  <div ?className ?style id={id}></div>
}
