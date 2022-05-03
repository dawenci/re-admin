type t =
  // Ajax 请求失败（非错误）
  | RequestFailed(JsonResult.error)
  // Json 解码失败
  | DecodeError(string)
  // 请求超时
  | TimeoutError
  // 请求被中止
  | AbortError
  // 其他 Js 错误
  | OtherError(string)

let print = err => {
  switch err {
  | RequestFailed(err) =>
    Js.Console.error2("AppError.RequestFailed:", err)
  | DecodeError(msg) =>
    Js.Console.error2("AppError.DecodeError:", msg)
  | TimeoutError =>
    Js.Console.error("AppError.TimeoutError")
  | AbortError =>
    Js.Console.error("AppError.AbortError")
  | OtherError(msg) =>
    Js.Console.error2("AppError.OtherError:", msg)
  }
}

let decode = (result: result<'a, string>): result<'a, t> =>
  switch result {
  | Ok(_) as ok => ok
  | Error(err) => Error(DecodeError(err))
  }
