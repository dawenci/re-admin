type t = {
  mode: [#History | #Hash],
  url: string,
  location: ReRouter_Location.t,
  match: ReRouter_Match.t,
}

let context = React.createContext(None)

let useRouter = () => {
  React.useContext(context)->Option.getExn
}

let useUrl = () => {
  useRouter().url
}

let useLocation = () => {
  useRouter().location
}

let useRouteMatch = () => {
  useRouter().match
}

let useParams = () => {
  useRouteMatch().params
}

let useQuery = () => {
  useRouteMatch().query
}

module ContextProvider = {
  let make = React.Context.provider(context)
}

module Provider = {
  @react.component
  let make = (~value: option<t>, ~children: React.element) => {
    let props = React.Context.makeProps(~value, ~children, ())
    React.createElement(ContextProvider.make, props)
  }
}
