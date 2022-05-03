type t = {
  // common
  "url": string,
  "method": option<ReFetch_RequestMethod.t>,
  "params": option<Js.Dict.t<string>>,
  "headers": option<Js.Dict.t<string>>,
  "abortController": option<ReFetch_AbortController.t>,
  "timeout": option<int>,
  "body": option<ReFetch_BodyInit.t>,
  "xsrfCookieName": option<string>,
  "xsrfHeaderName": option<string>,
  // fetch
  "credentials": option<ReFetch_RequestCredentials.t>,
  "mode": option<ReFetch_RequestMode.t>,
  "referrer": option<string>,
  "referrerPolicy": option<ReFetch_ReferrerPolicy.t>,
  "cache": option<ReFetch_RequestCache.t>,
  "redirect": option<ReFetch_Redirect.t>,
  "integrity": option<string>,
  "keepalive": option<bool>,
  // xhr
  "responseType": option<XMLHttpRequest.responseType>,
  "async": option<bool>,
  "user": option<string>,
  "password": option<string>,
  "withCredentials": option<bool>,
  "downloadProgress": option<ReFetch_Progress.progressCallback>,
  "uploadProgress": option<ReFetch_Progress.progressCallback>,
}
@obj
external make: (
  // common
  ~url: string,
  ~method: ReFetch_RequestMethod.t=?,
  ~params: Js.Dict.t<string>=?,
  ~headers: Js.Dict.t<string>=?,
  ~abortController: ReFetch_AbortController.t=?,
  ~timeout: int=?,
  ~body: ReFetch_BodyInit.t=?,
  ~xsrfCookieName: string=?,
  ~xsrfHeaderName: string=?,
  // fetch
  ~credentials: ReFetch_RequestCredentials.t=?,
  ~mode: ReFetch_RequestMode.t=?,
  ~referrer: string=?,
  ~referrerPolicy: ReFetch_ReferrerPolicy.t=?,
  ~cache: ReFetch_RequestCache.t=?,
  ~redirect: ReFetch_Redirect.t=?,
  ~integrity: string=?,
  ~keepalive: bool=?,
  // xhr
  ~responseType: XMLHttpRequest.responseType=?,
  ~async: bool=?,
  ~user: string=?,
  ~password: string=?,
  ~withCredentials: bool=?,
  ~downloadProgress: ReFetch_Progress.progressCallback=?,
  ~uploadProgress: ReFetch_Progress.progressCallback=?,
  unit,
) => t = ""

@val @scope("Object") external merge: (@as(json`{}`) _, t, t) => t = "assign"
