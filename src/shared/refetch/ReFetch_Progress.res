type progressData = {
  lengthComputable: bool,
  loaded: float,
  total: float,
  percent: float,
}
type progressCallback = progressData => unit


// // Fetch 的 download progress 处理
// let progress = (progressCallback: progressCallback) => {
//   (response: Fetch.Response.t) => {
//     let total = Headers.get("Content-Length", Response.headers(response))
//     switch total {
//     | Some(total) =>
//       let total = Int.fromString(total)->Option.getExn->Int.toFloat
//       let body = Response.body(response)
//       let headers = Response.headers(response)
//       let status = Response.status(response)
//       let statusText = Response.statusText(response)
//       let reader = ReadableStream.getReader(body)
//       let stream = ReadableStream.make({
//         "start": controller => {
//           // 下面的函数处理每个数据块
//           let rec loop = loaded => {
//             ReadableStream.read(reader)->Promise.then(({done, value}) => {
//               if done {
//                 ReadableStream.close(controller)
//                 Promise.resolve()
//               } else {
//                 let recieved = Js.TypedArray2.Uint8Array.length(value)->Int.toFloat
//                 let loaded = loaded +. recieved
//                 ReadableStream.enqueue(controller, value)
//                 let percent = loaded /. total *. 100.
//                 progressCallback({
//                   lengthComputable: true,
//                   loaded: loaded,
//                   total: total,
//                   percent: percent,
//                 })
//                 loop(loaded)
//               }
//             })
//           }
//           loop(0.)
//         },
//       })
//       // 原来的 response 已经被访问，创建一个新的 response 替代
//       Some(
//         Response.make(
//           stream,
//           {
//             "headers": headers,
//             "status": status,
//             "statusText": statusText,
//           },
//         ),
//       )
//     | None => None
//     }
//   }
// }
