

let backend = ImportMeta.getEnvVariable(#VITE_BACKEND)

let test = () => {
  let abortController = Request.AbortController.make()

  // let _ = Request.request(
  //   ~url=`${backend}/api/test/entity`,
  //   ~timeout=1000,
  //   ~abortController=abortController,
  //   ~method=Request.RequestMethod.Get,
  //   ~withCredentials=false,
  //   ()
  // )
  // ->Promise.thenResolve(Js.log)

  let _ = Request.request(
    ~url=`${backend}/api/test/entity`,
    ~timeout=1000,
    ~abortController=abortController,
    ~method=Request.RequestMethod.Get,
    ()
  )
  ->Promise.thenResolve(Js.log)

  let _ = Request.makeApi(Request.FetchRequest.request)(
    ~url=`${backend}/api/test/entity`,
    ~timeout=1000,
    ~abortController=abortController,
    ~method=Request.RequestMethod.Get,
    ()
  )
  ->Promise.thenResolve(Js.log)


  Request.AbortController.abort(abortController)
  
  // let c = Request.makeApi(Request.FetchRequest.request)(
  //   ~url=`${backend}/api/test/entity`,
  //   ~method=Request.RequestMethod.Get,
  //   ~timeout=5000,
  //   ~params=Js.Dict.fromArray([("a", "1"), ("b", "2"), ("c", "")]),
  //   ~downloadProgress=(e) => {
  //     Js.log(e)
  //   },
  //   ()
  // )
  // ->Promise.thenResolve(res => {
  //   let body = Request.Response.body(res)
  //   Js.log2("BODY:", body)
  //   Request.Response.json(res)
  // })
  // ->Promise.thenResolve(json => {
  //   Js.log2("JSON:", json)
  // })
  // ->Promise.catch(exn => {
  //   switch exn {
  //   | Request.Timeout =>
  //     Js.log2("TIMEOUT!!!!", exn)
  //     Promise.reject(exn)
  //   | _ =>
  //     Js.log(exn)
  //     Promise.reject(exn)
  //   }
  // })
  // Js.log(c)
}
