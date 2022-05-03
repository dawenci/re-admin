@module("@loadable/component")
external loadable: ('props => Js.Promise.t<'a>) => 'a = "default"

@module("@loadable/component")
external loadable2: ('props => Js.Promise.t<'a>, 'options) => 'a = "default"

@module("@loadable/component")
external lazy_: ('props => Js.Promise.t<'a>) => 'a = "lazy"
