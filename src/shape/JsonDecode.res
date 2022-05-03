open Option
open Js.Json
open Js.Dict

let decodeEntity: Js.Json.t => result<JsonResult.entity, AppError.t> = json => {
  try {
    let obj = decodeObject(json)->getExn
    let message = obj->unsafeGet("message")->decodeString->getExn
    let data = obj->get("data")->flatMap(dataJson => dataJson->decodeObject)->getExn
    let entity = data->get("entity")->getExn
    let data: JsonResult.entityData = { entity: entity }
    Result.Ok({message, data})
  } catch {
  | _ =>
    Js.Console.error("JsonResult.decodeEntity error.")
    Result.Error(AppError.DecodeError(`JsonResult.decodeEntity error.`))
  }
}

let decodeList: Js.Json.t => result<JsonResult.list, AppError.t> = json => {
  try {
    let obj = decodeObject(json)->getExn
    let message = obj->unsafeGet("message")->decodeString->getExn
    let data = obj->get("data")->flatMap(dataJson => dataJson->decodeObject)->getExn
    let list = data->get("list")->getExn->decodeArray->getExn
    let page = data->get("page")->flatMap(pageJson => pageJson->decodeNumber)->getExn->Float.toInt
    let pageSize =
      data
      ->get("pageSize")
      ->flatMap(pageSizeJson => pageSizeJson->decodeNumber)
      ->getExn
      ->Float.toInt
    let totalCount =
      data
      ->get("totalCount")
      ->flatMap(totalCountJson => totalCountJson->decodeNumber)
      ->getExn
      ->Float.toInt
    Result.Ok({
      message: message,
      data: {list: list, page: page, pageSize: pageSize, totalCount: totalCount},
    })

  } catch {
  | _ =>
    Js.Console.error("JsonResult.decodeList error.")
    Result.Error(AppError.DecodeError(`JsonResult.decodeList error.`))
  }
}

let decodeError: Js.Json.t => result<JsonResult.error, AppError.t> = json => {
  try {
    let obj = decodeObject(json)->getExn
    let message = obj->unsafeGet("message")->decodeString->getExn
    let errors = obj->get("errors")->flatMap(errorsJson => errorsJson->decodeArray)
    let details = switch errors {
    | Some(errors) => errors
    | None => []
    }
    Result.Ok({ message, details })
  } catch {
  | _ =>
    Js.Console.error("JsonResult.decodeError error.")
    Result.Error(AppError.DecodeError(`JsonResult.decodeError error.`))
  }
}
