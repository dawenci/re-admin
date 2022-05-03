include ReFetch

// 默认前置拦截器：
// 1. 附加 token 请求头
// 2. 附加 content type
let addHeaderPreInterceptor = (options: RequestOptions.t) => {
  let headers = Option.getWithDefault(options["headers"], Js.Dict.empty())
  switch Dom.Storage2.localStorage->Dom.Storage2.getItem("jwtToken") {
  | Some(token) =>
    headers->Js.Dict.set("Authorization", `Token ${token}`)
  | None => ()
  }

  headers->Js.Dict.set("Content-Type", `application/json; charset=UTF-8`)

  let opt = RequestOptions.make(~url=options["url"], ~headers=headers, ())
  let options = RequestOptions.merge(options, opt)
  Promise.resolve(options)
}

// 默认候置拦截器
// 1. 将 response 解析成 json
let toJsonPostInterceptor = (response: Response.t) => {
  Response.json(response)
  ->Promise.then(json => {
    Result.Ok(json)->Promise.resolve
  })
}

let handleErrorPostInterceptor = (exn) => {
  switch exn {
  | Failed(response) =>
    let status = Response.status(response)
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
    Response.json(response)->Promise.then(json => {
      switch json->JsonDecode.decodeError {
      | Result.Ok(decoded) => decoded->AppError.RequestFailed->Result.Error->Promise.resolve
      | Result.Error(appError) => appError->Result.Error->Promise.resolve
      }
    })
  | TimeoutError => AppError.TimeoutError->Result.Error->Promise.resolve
  | AbortError => AppError.AbortError->Result.Error->Promise.resolve
  | _ => AppError.OtherError("Js Error")->Result.Error->Promise.resolve
  }
}

// 应用了默认拦截器的 xhr 实现
let xhrRequestImpl = XhrRequest.request
  // 附加通用请求头
  ->Interceptor.pre(addHeaderPreInterceptor)
  // 转发非 200 系列请求到 catch
  ->Interceptor.post(throwUnsuccessfulResponsePostInterceptor)
  // toJSON
  ->Interceptor.post(toJsonPostInterceptor)
  ->Interceptor.postCatch(handleErrorPostInterceptor)

// 应用了默认拦截器的 fetch 实现
let fetchRequestImpl = FetchRequest.request
  // 附加通用请求头
  ->Interceptor.pre(addHeaderPreInterceptor)
  // 转发非 200 系列请求到 catch
  ->Interceptor.post(throwUnsuccessfulResponsePostInterceptor)
  // toJSON
  ->Interceptor.post(toJsonPostInterceptor)
  ->Interceptor.postCatch(handleErrorPostInterceptor)

// 对外API
let request = makeApi(options => {
  let isXhrRequest = switch (
    options["responseType"],
    options["async"],
    options["user"],
    options["password"],
    options["withCredentials"],
    options["downloadProgress"],
    options["uploadProgress"],
  ) {
  | (None, None, None, None, None, None, None) => false
  | _ => true
  }
  let impl = isXhrRequest ? xhrRequestImpl : fetchRequestImpl
  impl(options)
})

// 默认快捷方式
let get = url => request(~url, ~method=Get, ())
let post = (url: string, data: BodyInit.t) => request(~url, ~method=Post, ~body=data, ())
let put = (url: string, data: BodyInit.t) => request(~url, ~method=Put, ~body=data, ())
let delete = (url: string) => request(~url, ~method=Delete, ())
