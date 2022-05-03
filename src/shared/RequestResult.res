
type error = {
  message: string
}

type list<'data> = { page: int, pageSize: int, totalCount: int, list: array<'data> }
type entity<'data> = { entity: 'data }

type t<'data> = {
  data: Js.Undefined.t<'data>,
  errors: Js.Undefined.t<array<error>>,
  message: string,
}
