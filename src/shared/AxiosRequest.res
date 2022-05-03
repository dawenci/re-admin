let utf8ContentType = [("Content-Type", "application/json; charset=UTF-8")]

let makeHeaders = (headers: array<(string, string)>) => {
  headers->Js.Dict.fromArray->Axios.Headers.fromDict
}

let makeHeadersWithToken = (headers: array<(string, string)>) => {
  let jwtToken = Dom.Storage2.localStorage->Dom.Storage2.getItem("jwtToken")
  let headerArr = switch jwtToken {
  | None => headers
  | Some(token) => headers->Array.concat([("Authorization", `Token ${token}`)])
  }

  headerArr->makeHeaders
}

let makeConfig = Axios.makeConfig

let makeDefaultConfig = () => {
  let headers = makeHeaders(utf8ContentType)
  makeConfig(~headers, ())
}

let axiosInstanceConfig = Axios.makeConfig(~timeout=DateUtils.minuteInMs * 2, ())
let axios = Axios.Instance.create(axiosInstanceConfig)

module AxiosInterceptorManager = {
  type t<'a>
  type interceptors'
  type ejectId = float

  @get external interceptors: Axios.Instance.t => interceptors' = "interceptors"
  @get external request: interceptors' => t<Axios_types.config> = "request"
  @get external response: interceptors' => t<Axios_types.response<'data, 'header>> = "response"

  @send
  external useRequest_: (
    t<'a>,
    Axios_types.config => Promise.t<Axios_types.config>,
    exn => Promise.t<'any>,
  ) => ejectId = "use"

  @send
  external useResponse_: (
    t<'a>,
    Axios_types.response<'data, 'header> => Axios_types.response<'data, 'header>,
    exn => Promise.t<'any>,
  ) => ejectId = "use"

  let useRequest: (
    Axios.Instance.t,
    Axios_types.config => Promise.t<Axios_types.config>,
    exn => Promise.t<'any>,
  ) => ejectId = (axios, onFulfilled, onRejected) => {
    axios->interceptors->request->useRequest_(onFulfilled, onRejected)
  }

  let useResponse: (
    Axios.Instance.t,
    Axios_types.response<'data, 'header> => Axios_types.response<'data, 'header>,
    exn => Promise.t<'any>,
  ) => ejectId = (axios, onFulfilled, onRejected) => {
    axios->interceptors->response->useResponse_(onFulfilled, onRejected)
  }
}

module Headers = {
  external fromDict: Js.Dict.t<string> => Axios.Headers.t = "%identity"
  external toDict: Axios.Headers.t => Js.Dict.t<string> = "%identity"
  external fromObj: Js.t<{..}> => Axios.Headers.t = "%identity"
  external toObj: Axios.Headers.t => Js.t<{..}> = "%identity"

  @scope("Object") @val
  external merge: (Axios.Headers.t, Axios.Headers.t) => Axios.Headers.t = "assign"

  @scope("Object") @val
  external mergeObj: (Axios.Headers.t, Js.t<{..}>) => Axios.Headers.t = "assign"
}

module Config = {
  external fromDict: Js.Dict.t<string> => Axios_types.config = "%identity"
  external toDict: Axios_types.config => Js.Dict.t<string> = "%identity"
  external toObj: Axios_types.config => Js.t<{..}> = "%identity"
  external fromObj: Js.t<{..}> => Axios_types.config = "%identity"

  @get external getHeader: Axios_types.config => Axios.Headers.t = "headers"

  let mergeHeader: (Axios_types.config, Js.t<{..}>) => unit = (config, obj) => {
    let merged = Headers.mergeObj(getHeader(config), obj)
    Js.log(merged)
  }
}

module AxiosError = {
  type t
  external asAxiosError: exn => t = "%identity"
  external jsExnAsAxiosError: Js.Exn.t => t = "%identity"

  @module("axios") external isCancelError: t => bool = "isCancel"
  @get external isAxiosError: exn => bool = "isAxiosError"
  @get external getConfig: t => Axios_types.config = "config"
  @get external getResponse: t => option<Axios_types.response<'a, 'b>> = "response"
  @get external _status: option<Axios_types.response<'a, 'b>> => option<int> = "status"
  @get external _message: t => option<string> = "message"

  let getStatus: t => int = err => {
    let response = getResponse(err)
    let status = _status(response)
    switch status {
    | Some(n) => n
    | None => 408
    }
  }

  let getMessage: t => string = err => {
    switch _message(err) {
    | Some(str) => str
    | _ => ""
    }
  }
}

exception AxiosExn(exn)

let _ = AxiosInterceptorManager.useRequest(
  axios,
  config => {
    // Js.log("AxiosInterceptorManager.useRequest")
    let _ = Headers.merge(Config.getHeader(config), makeHeadersWithToken([]))
    config->Promise.resolve
  },
  err => {
    err->Promise.reject
  },
)

let _ = AxiosInterceptorManager.useResponse(
  axios,
  response => {
    response
  },
  exn => {
    if AxiosError.isAxiosError(exn) {
      let err = AxiosError.asAxiosError(exn)

      if AxiosError.isCancelError(err) {
        ()
      } else {
        // 如果 axios 超时，则不会有 response，设置为 408，后续统一处理
        let status = AxiosError.getStatus(err)
        let msg = if status == 408 {
          "Request Timeout"
        } else if status == 401 {
          "Unauthorized"
        } else if status == 403 {
          "Forbidden"
        } else if status == 413 {
          "Payload Too Large"
        } else if status == 500 {
          "Internal Server Error"
        } else {
          "Error Occurred"
        }
        Js.log(msg)
        if status === 401 {
          "/#/login"->ReRouter.push
        }
        if status === 403 {
          "/#/403"->ReRouter.push
        }
      }
    }

    exn->AxiosExn->Promise.reject
  },
)

let defaultErrorHandler = (exn, apiName) => {
  let err = switch exn {
  | AxiosExn(exn) => exn
  | _ => exn
  }->AxiosError.asAxiosError
  let status = err->AxiosError.getStatus
  let msg = err->AxiosError.getMessage

  Js.log(`[${apiName}] AxiosError, status: ${status->Int.toString}, message: ${msg}`)

  AppError.DecodeError(msg)->Result.Error->Promise.resolve  
}
