@react.component
let make = (
  ~children,
  ~fill="#000",
  ~viewBox="0 0 1024 1024",
  ~width="200",
  ~height="200",
  ~className: option<string>=?,
  ~style: option<ReactDOM.Style.t>=?,
) => {
  <svg
    ?className
    viewBox={viewBox}
    fill={fill}
    xmlns="http://www.w3.org/2000/svg"
    width={width}
    height={height}
    ?style>
    {children}
  </svg>
}
