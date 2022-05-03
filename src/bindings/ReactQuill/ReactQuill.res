@module("react-quill/dist/quill.snow.css")
external importTheme: unit = "default"

@module("react-quill") @react.component
external make: (
  ~theme: string=?,
  ~formats: array<string>=?,
  ~modules: 'a=?,
  ~style: 'b=?,
  ~className: string=?,
  ~value: string=?,
  ~onChange: 'c=?,
) => React.element = "default"

