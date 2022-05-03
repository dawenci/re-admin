open Promise

module Endpoints = {
  let backend = ImportMeta.getEnvVariable(#VITE_BACKEND)
  let root = `${backend}/api/chart`
  let chart = (name) => `${root}/${name}`
}

module Conversion = {
  type t = {
    "month": string,
    "value": string
  }

  let decodeList = (data: RequestResult.t<RequestResult.list<t>>): Result.t<array<t>, AppError.t> => {
    switch data.data->Js.Undefined.toOption {
    | Some(data) => Result.Ok(data.list)
    | _ => Result.Error(AppError.DecodeError("User: failed to decode json"))
    }
  }

  let load = () => {
    let config = AxiosRequest.makeDefaultConfig()
    AxiosRequest.axios
    ->Axios.Instance.getc(Endpoints.chart("conversion"), config)
    ->then(result => result["data"]->decodeList->resolve)
    ->catch(exn => {
      AxiosRequest.defaultErrorHandler(exn, "ChartDemoApi.conversion")
    })
  }
}

module Order = {
  type t = {
    "month": string,
    "value": string
  }

  let decodeList = (data: RequestResult.t<RequestResult.list<t>>): Result.t<array<t>, AppError.t> => {
    switch data.data->Js.Undefined.toOption {
    | Some(data) => Result.Ok(data.list)
    | _ => Result.Error(AppError.DecodeError("User: failed to decode json"))
    }
  }

  let load = () => {
    let config = AxiosRequest.makeDefaultConfig()
    AxiosRequest.axios
    ->Axios.Instance.getc(Endpoints.chart("orders"), config)
    ->then(result => result["data"]->decodeList->resolve)
    ->catch(exn => {
      AxiosRequest.defaultErrorHandler(exn, "ChartDemoApi.orders")
    })
  }
}
