module Endpoints = {
  let backend = ImportMeta.getEnvVariable(#VITE_BACKEND)
  
  let root = `${backend}/api/users`
  let login = `${backend}/api/users/login`
  let user = `${backend}/api/user`
}

let currentUser: unit => Promise.t<result<User.t, AppError.t>> = () => {
  Request.request(~url=Endpoints.user, ())
  ->Promise.then(result => {
    switch result {
    | Result.Ok(json) => User.decodeEntity(json)
    | Result.Error(_) as err => err
    }
    ->Promise.resolve
  })
}

let updateUser: (
  ~user: User.t,
  ~password: string,
  unit,
) => Promise.t<result<User.t, AppError.t>> = (~user, ~password, ()) => {
  let data = {
    "user": user,
    "password": password,
  }
  let body = Request.BodyInit.make(Js.Json.stringifyAny(data)->Option.getExn)
  Request.put(Endpoints.user, body)
  ->Promise.then(result => {
    switch result {
    | Result.Ok(json) => User.decodeEntity(json)
    | Result.Error(_) as err => err
    }
    ->Promise.resolve
  })
}

let login = (~email: string, ~password: string): Promise.t<result<User.t, AppError.t>> => {
  let data = {
    let user = {
      let dict = Js.Dict.empty()
      Js.Dict.set(dict, "email", Js.Json.string(email))
      Js.Dict.set(dict, "password", Js.Json.string(password))
      Js.Json.object_(dict)
    }
    let dict = Js.Dict.empty()
    Js.Dict.set(dict, "user", user)
    Js.Json.object_(dict)
  }
  let body = Request.BodyInit.make(Js.Json.stringify(data))

  Request.post(Endpoints.login, body)
  ->Promise.then(result => {
    switch result {
    | Result.Ok(json) => User.decodeEntity(json)
    | Result.Error(_) as err => err
    }
    ->Promise.resolve
  })
}

let register: (
  ~username: string,
  ~email: string,
  ~password: string,
) => Promise.t<result<User.t, AppError.t>> = (~username, ~email, ~password) => {
  let data = {
    let user = {
      let dict = Js.Dict.empty()
      Js.Dict.set(dict, "email", Js.Json.string(email))
      Js.Dict.set(dict, "username", Js.Json.string(username))
      Js.Dict.set(dict, "password", Js.Json.string(password))
      Js.Json.object_(dict)
    }
    let dict = Js.Dict.empty()
    Js.Dict.set(dict, "user", user)
    Js.Json.object_(dict)
  }
  let body = Request.BodyInit.make(Js.Json.stringify(data))
  Request.post(Endpoints.root, body)
  ->Promise.then(result => {
    switch result {
    | Result.Ok(json) => User.decodeEntity(json)
    | Result.Error(_) as appErr => appErr
    }
    ->Promise.resolve
  })
}

let getUsers = query => {
  Request.request(
    ~url=Endpoints.root,
    ~method=Request.RequestMethod.Get,
    ~params=query,
    ()
  )
  ->Promise.then(result => {
    switch result {
    | Result.Ok(json) => User.decodeList(json)
    | Result.Error(_) as appErr => appErr
    }
    ->Promise.resolve
  })
}
