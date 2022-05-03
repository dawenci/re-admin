module Json = Js.Json
module Dict = Js.Dict

type decodeError = string

module Settings = {
  type t = {
    email: option<array<string>>,
    bio: option<array<string>>,
    image: option<array<string>>,
    username: option<array<string>>,
    password: option<array<string>>,
  }

  let decode = (json: t): Result.t<t, decodeError> => {
    try {
      Result.Ok(json)
    } catch {
    | _ => Error("Shape.Settings: failed to decode json")
    }
  }
}

module Editor = {
  type t = {
    title: option<array<string>>,
    body: option<array<string>>,
    description: option<array<string>>,
  }

  let decode = (json: t): Result.t<t, decodeError> => {
    try {
      Result.Ok(json)
    } catch {
    | _ => Error("Shape.Editor: failed to decode json")
    }
  }
}

module Login = {
  type t = option<array<string>>

  let decode = (json: t): Result.t<t, decodeError> => {
    try {
      json->Ok
    } catch {
    | _ => Error("Shape.Login: failed to decode json")
    }
  }
}

module Register = {
  type t = {
    email: option<array<string>>,
    password: option<array<string>>,
    username: option<array<string>>,
  }

  let decode = (json: t): Result.t<t, decodeError> => {
    try {
      Result.Ok(json)
    } catch {
    | _ => Error("Shape.Register: failed to decode json")
    }
  }
}
