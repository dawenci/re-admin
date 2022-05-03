open Js.Dict
open Js.Json

type t = {
  id: string,
  roles: array<string>,
  createdAt: string,
  updatedAt: string,
  email: string,
  username: string,
  nickname: string,
  bio: string,
  image: Js.Null.t<string>,
  token: Js.Null.t<string>,
}

let empty = {
  id: "",
  roles: [],
  createdAt: Js.Date.make()->Js.Date.toString,
  updatedAt: Js.Date.make()->Js.Date.toString,
  email: "",
  username: "",
  nickname: "",
  bio: "",
  image: Js.Null.empty,
  token: Js.Null.empty,
}

let decodeUser = (json: Js.Json.t): Result.t<t, AppError.t> => {
  try {
    let dict = json->Js.Json.decodeObject->Option.getExn
    let user = {
      id: dict->unsafeGet("id")->decodeString->Option.getExn,
      roles: dict
      ->unsafeGet("roles")
      ->decodeArray
      ->Option.getExn
      ->Js.Array2.map(role => role->decodeString->Option.getExn),
      createdAt: dict->unsafeGet("createdAt")->decodeString->Option.getExn,
      updatedAt: dict->unsafeGet("updatedAt")->decodeString->Option.getExn,
      email: dict->unsafeGet("email")->decodeString->Option.getExn,
      username: dict->unsafeGet("username")->decodeString->Option.getExn,
      nickname: dict->unsafeGet("nickname")->decodeString->Option.getExn,
      bio: dict->unsafeGet("bio")->decodeString->Option.getExn,
      image: dict->unsafeGet("image")->decodeString->Js.Null.fromOption,
      token: dict->unsafeGet("token")->decodeString->Js.Null.fromOption,
    }
    Result.Ok(user)
  } catch {
  | _ =>
    Js.Console.error(`Decode user error.`)
    Result.Error(AppError.DecodeError(`decode error`))
  }
}

let decodeEntity = (json: Js.Json.t): Result.t<t, AppError.t> => {
  JsonDecode.decodeEntity(json)
  ->Result.flatMap(decoded => decodeUser(decoded.data.entity))
}

let decodeList = (json: Js.Json.t): Result.t<array<t>, AppError.t> => {
  JsonDecode.decodeList(json)
  ->Result.flatMap(decoded => {
    try {
      decoded.data.list
      ->Js.Array2.map(user => {
        switch decodeUser(user) {
        | Result.Ok(user) => user
        | Result.Error(_) => raise(Js.Exn.raiseError("decode user item error"))
        }
      })
      ->Result.Ok
    } catch {
    | _ => Result.Error(AppError.DecodeError(`decode error`))
    }
  })
}
