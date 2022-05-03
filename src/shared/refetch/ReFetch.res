module RequestMethod = ReFetch_RequestMethod
module ReferrerPolicy = ReFetch_ReferrerPolicy
module RequestType = ReFetch_RequestType
module RequestCredentials = ReFetch_RequestCredentials
module RequestCache = ReFetch_RequestCache
module Redirect = ReFetch_Redirect
module RequestDestination = ReFetch_RequestDestination
module RequestMode = ReFetch_RequestMode
module AbortSignal = ReFetch_AbortSignal
module AbortController = ReFetch_AbortController
module HeadersInit = ReFetch_HeadersInit
module Headers = ReFetch_Headers
module BodyInit = ReFetch_BodyInit
module Body = ReFetch_Body
module RequestInit = ReFetch_RequestInit
module Request = ReFetch_Request
module Response = ReFetch_Response
module FormData = ReFetch_FormData
module ReadableStream = ReFetch_ReadableStream
module Blob = ReFetch_Blob
module Progress = ReFetch_Progress

exception Failed(Response.t)
exception TimeoutError
exception AbortError
exception Error(Js.Exn.t)

let fetch = Fetch.fetch
let fetchWithInit = Fetch.fetchWithInit
let fetchWithRequest = Fetch.fetchWithRequest
let fetchWithRequestInit = Fetch.fetchWithRequestInit
let stringBody = data => data->BodyInit.make
let jsonBody = data => data->Js.Json.stringify->BodyInit.make
let blobBody = data => data->BodyInit.makeWithBlob
let bufferSourceBody = data => data->BodyInit.makeWithBufferSource

// 生成流
let makeResponse = (
  ~status: int,
  ~statusText: string,
  ~headers: 'headers,
  ~data: 'data,
  ~responseType: XMLHttpRequest.responseType,
) => {
  let data = switch responseType {
  | #json => [Js.Json.stringifyAny(data)->Option.getExn]->Blob.makeFromStrings
  | #text => [data]->Blob.makeFromStrings
  | _ => Blob.asBlob(data)
  }
  Response.make(
    data,
    {
      "headers": headers,
      "status": status,
      "statusText": statusText,
    },
  )
}

let normalizeUrl = (url, params) => {
  // 处理 params
  let queryString =
    params
    ->Js.Dict.keys
    ->Js.Array2.map(key => {
      let value = Js.Dict.get(params, key)
      switch value {
      | Some(value) => value == "" ? key : key ++ "=" ++ value
      | None => key
      }
    })
    ->Js.Array2.joinWith("&")
  let url = queryString == "" ? url : url ++ "?" ++ queryString
  url
}

let addXsrfHeader = (headers, xsrfHeaderName, xsrfCookieName) => {
  switch (xsrfCookieName, xsrfHeaderName) {
  | (Some(cookieName), Some(headerName)) =>
    let xsrfValue = CookieUtils.getCookie(cookieName)
    switch xsrfValue {
    | Some(value) => Js.Dict.set(headers, headerName, value)
    | None => ()
    }
  | _ => ()
  }
  headers
}

module RequestOptions = ReFetch_RequestOptions

module RequestImpl = {
  type t = RequestOptions.t => Promise.t<Response.t>
}

module Interceptor = {
  let pre: (
    RequestImpl.t,
    RequestOptions.t => Promise.t<RequestOptions.t>
  ) => RequestImpl.t = (impl, mapOptions) => {
    options => {
      mapOptions(options)
      ->Promise.then(options => {
        let aborted = switch options["abortController"] {
        | Some(abortController) => AbortSignal.aborted(AbortController.signal(abortController))
        | None => false
        }
        if aborted {
          Promise.reject(AbortError)
        }
        else {
          impl(options)
        }
      })
    }
  }

  let post: (RequestOptions.t => Promise.t<'a>, 'a => Promise.t<'b>) => (RequestOptions.t => Promise.t<'b>) = (preImpl, mapResult) => {
    options => preImpl(options)->Promise.then(mapResult)
  }

  let postCatch: (RequestOptions.t => Promise.t<'a>, 'exn => Promise.t<'b>) => (RequestOptions.t => Promise.t<'b>) = (preImpl, mapError) => {
    options => preImpl(options)->Promise.catch(mapError)
  }
}

module XhrRequest = {
  let request: RequestImpl.t = (options: RequestOptions.t) => {
    let xhr = XMLHttpRequest.make()

    let decodedMethod = ReFetch_RequestMethod.decode(Option.getWithDefault(options["method"], Get))

    switch options["withCredentials"] {
    | Some(withCredentials) => XMLHttpRequest.setWithCredentials(xhr, withCredentials)
    | None => ()
    }

    switch options["responseType"] {
    | Some(responseType) => XMLHttpRequest.setResponseType(xhr, responseType)
    | None => ()
    }

    // 处理超时
    switch options["timeout"] {
    | Some(timeout) => XMLHttpRequest.setTimeout(xhr, timeout)
    | None => ()
    }

    // 处理 xsrf
    let headers = addXsrfHeader(
      Option.getWithDefault(options["headers"], Js.Dict.empty()),
      options["xsrfHeaderName"],
      options["xsrfCookieName"],
    )

    let makeProgressCallback = (callback: Progress.progressCallback) => {
      event => {
        let lengthComputable = XMLHttpRequest.ProgressEvent.lengthComputable(event)
        let loaded = XMLHttpRequest.ProgressEvent.loaded(event)
        let total = XMLHttpRequest.ProgressEvent.total(event)
        let percent = lengthComputable ? loaded /. total *. 100. : 0.
        callback({
          lengthComputable: lengthComputable,
          loaded: loaded,
          total: total,
          percent: percent,
        })
      }
    }

    // 处理 upload progress
    switch options["uploadProgress"] {
    | Some(uploadProgress) =>
      // upload progress 事件，需要在 send 之前绑定
      let upload = XMLHttpRequest.upload(xhr)
      XMLHttpRequest.XMLHttpRequestUpload.setOnprogress(
        upload,
        makeProgressCallback(uploadProgress),
      )
    | None => ()
    }

    // 处理 download progress
    switch options["downloadProgress"] {
    | Some(downloadProgress) =>
      XMLHttpRequest.setOnprogress(xhr, makeProgressCallback(downloadProgress))
    | None => ()
    }

    // 处理请求取消
    let abortController = Option.getWithDefault(options["abortController"], AbortController.make())
    let signal = AbortController.signal(abortController)
    let rec onSignalAbort = _ => {
      AbortSignal.removeEventListener(signal, "abort", onSignalAbort)
      XMLHttpRequest.abort(xhr)
    }
    AbortSignal.addEventListener(signal, "abort", onSignalAbort)

    // promise 包装
    let promise = Promise.make((resolve, reject) => {
      XMLHttpRequest.setOnabort(xhr, (_event: XMLHttpRequest.ProgressEvent.t) => {
        AbortSignal.removeEventListener(signal, "abort", onSignalAbort)
        reject(. AbortError)
      })
      XMLHttpRequest.setOnerror(xhr, (_event: XMLHttpRequest.ProgressEvent.t) => {
        AbortSignal.removeEventListener(signal, "abort", onSignalAbort)
        reject(. Error(Js.Exn.raiseError("Error")))
      })
      XMLHttpRequest.setOntimeout(xhr, (_event: XMLHttpRequest.ProgressEvent.t) => {
        AbortSignal.removeEventListener(signal, "abort", onSignalAbort)
        reject(. TimeoutError)
      })
      XMLHttpRequest.setOnload(xhr, (_event: XMLHttpRequest.ProgressEvent.t) => {
        AbortSignal.removeEventListener(signal, "abort", onSignalAbort)
        let status = XMLHttpRequest.status(xhr)
        let statusText = XMLHttpRequest.statusText(xhr)
        let headers = XMLHttpRequest.getAllResponseHeaders(xhr)->XMLHttpRequest.parseHeaders
        let responseType = Option.getWithDefault(options["responseType"], #text)
        let data = XMLHttpRequest.response(xhr)
        let response = makeResponse(~status, ~statusText, ~headers, ~data, ~responseType)
        // 注意，status 为 200-299 之外的情况，也视为成功，
        // 使用时可以使用 Interceptor.post 将非 Response.ok 的情况转发到 catch 分支
        resolve(. response)
      })
    })

    // open
    let params = Option.getWithDefault(options["params"], Js.Dict.empty())
    let url = normalizeUrl(options["url"], params)
    switch (options["password"], options["user"], options["async"]) {
    | (Some(password), Some(user), Some(async)) =>
      XMLHttpRequest.open4(xhr, decodedMethod, url, async, user, password)
    | (None, Some(user), Some(async)) => XMLHttpRequest.open3(xhr, decodedMethod, url, async, user)
    | (None, None, Some(async)) => XMLHttpRequest.open2(xhr, decodedMethod, url, async)
    | _ => XMLHttpRequest.open1(xhr, decodedMethod, url)
    }

    // headers
    headers
    ->Js.Dict.keys
    ->Js.Array2.forEach(key => {
      let value = Js.Dict.get(headers, key)
      switch value {
      | Some(value) => XMLHttpRequest.setRequestHeader(xhr, key, value)
      | None => ()
      }
    })

    // send
    switch options["body"] {
    | Some(body) => XMLHttpRequest.sendBody(xhr, body)
    | None => XMLHttpRequest.send(xhr)
    }

    // signal 传入时已经处于 aborted 状态
    if AbortSignal.aborted(signal) {
      XMLHttpRequest.abort(xhr)
    }

    promise
  }
}

module FetchRequest = {
  let request: RequestImpl.t = (options: RequestOptions.t) => {
    let params = Option.getWithDefault(options["params"], Js.Dict.empty())
    let url = normalizeUrl(options["url"], params)

    // 处理 xsrf
    let headers = addXsrfHeader(
      Option.getWithDefault(options["headers"], Js.Dict.empty()),
      options["xsrfHeaderName"],
      options["xsrfCookieName"],
    )

    // 构造请求配置
    let abortController = Option.getWithDefault(options["abortController"], AbortController.make())
    let signal = AbortController.signal(abortController)

    let init = RequestInit.make(
      ~method_=Option.getWithDefault(options["method"], Get)->RequestMethod.convertRequestMethod,
      ~headers=HeadersInit.makeWithDict(headers),
      ~body=?options["body"],
      ~signal,
      ~credentials=?options["credentials"]->Option.map(
        RequestCredentials.convertRequestCredentials,
      ),
      ~mode=?options["mode"],
      ~referrer=?options["referrer"],
      ~referrerPolicy=?options["referrerPolicy"]->Option.map(ReferrerPolicy.convertReferrerPolicy),
      ~cache=?options["cache"]->Option.map(RequestCache.convertRequestCache),
      ~redirect=?options["redirect"]->Option.map(Redirect.convertRequestRedirect),
      ~integrity=?options["integrity"],
      ~keepalive=?options["keepalive"],
      (),
    )

    // 标记 timeout，以区分其他 abort
    let timeoutFlag = ref(false)
    // 方便请求结束后，清理定时器
    let clearTimeout = switch options["timeout"] {
    | Some(timeout) =>
      let timerId = Js.Global.setTimeout(() => {
        timeoutFlag := true
        AbortController.abort(abortController)
      }, timeout)

      () => Js.Global.clearTimeout(timerId)
    | None => () => ()
    }

    let promise =
      fetchWithInit(url, init)
      ->Promise.then(response => {
        clearTimeout()
        
        // 注意，status 为 200-299 之外的情况，也视为成功，
        // 使用时可以使用 Interceptor.post 将非 Response.ok 的情况转发到 catch 分支
        Promise.resolve(response)
      })

      // 1. AbortError，AbortController.abort 时候，抛 AbortError
      // 2. TypeError，在 URL 中包含用户名、密码时候，抛 TypeError 错误，例如 http://user:password@example.com
      ->Promise.catch(exn => {
        clearTimeout()
        switch exn {
        | Promise.JsError(exn) =>
          let isAbortError = Js.Exn.name(exn)->Option.getWithDefault("") == "AbortError"
          if isAbortError {
            // 由于 timeout 也是基于 abort 模拟的，需要通过 flag 区分出来
            if timeoutFlag.contents {
              Promise.reject(TimeoutError)
            } else {
              Promise.reject(AbortError)
            }
          }
          // 其他错误不再区分
          else {
            Promise.reject(Error(exn))
          }
        | _ => Promise.reject(exn)
        }
      })

    promise
  }
}

let makeApi = (impl: RequestOptions.t => Promise.t<'a>) => {
  (
    // common
    ~url: string,
    ~method: option<RequestMethod.t>=?,
    ~params: option<Js.Dict.t<string>>=?,
    ~headers: option<Js.Dict.t<string>>=?,
    ~abortController: option<AbortController.t>=?,
    ~timeout: option<int>=?,
    ~body: option<BodyInit.t>=?,
    ~xsrfCookieName: option<string>=?,
    ~xsrfHeaderName: option<string>=?,
    // fetch
    ~credentials: option<RequestCredentials.t>=?,
    ~mode: option<RequestMode.t>=?,
    ~referrer: option<string>=?,
    ~referrerPolicy: option<ReferrerPolicy.t>=?,
    ~cache: option<RequestCache.t>=?,
    ~redirect: option<Redirect.t>=?,
    ~integrity: option<string>=?,
    ~keepalive: option<bool>=?,
    // xhr
    ~responseType: option<XMLHttpRequest.responseType>=?,
    ~async: option<bool>=?,
    ~user: option<string>=?,
    ~password: option<string>=?,
    ~withCredentials: option<bool>=?,
    ~downloadProgress: option<Progress.progressCallback>=?,
    ~uploadProgress: option<Progress.progressCallback>=?,
    (),
  ) => {
    let options = RequestOptions.make(
      ~url,
      ~method?,
      ~params?,
      ~headers?,
      ~abortController?,
      ~timeout?,
      ~body?,
      ~xsrfCookieName?,
      ~xsrfHeaderName?,

      ~credentials?,
      ~mode?,
      ~referrer?,
      ~referrerPolicy?,
      ~cache?,
      ~redirect?,
      ~integrity?,
      ~keepalive?,
      
      ~responseType?,
      ~async?,
      ~user?,
      ~password?,
      ~withCredentials?,
      ~downloadProgress?,
      ~uploadProgress?,
      
      ()
    )
    impl(options)
  }
}

// 非 200-299 状态码的结果，全部转发到 catch 分支
let throwUnsuccessfulResponsePostInterceptor: Response.t => Promise.t<Response.t> = (response) => {
  if Response.ok(response) {
    Promise.resolve(response)
  } else {
    Promise.reject(Failed(response))
  }
}
