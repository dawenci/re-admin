type entityData = {
  entity: Js.Json.t
}

type listData = {
  page: int,
  pageSize: int,
  totalCount: int,
  list: array<Js.Json.t>,
}

type list = {
  data: listData,
  message: string,
}

type entity = {
  data: entityData,
  message: string,
}

type error = {
  message: string,
  details: array<Js.Json.t>
}
