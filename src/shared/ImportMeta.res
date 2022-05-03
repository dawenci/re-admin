
@scope("import") @val external meta: Js.t<{..}> = "meta"
@scope(("import", "meta")) @val external url: string = "url"
@scope(("import", "meta")) @val external env: Js.Dict.t<string> = "env"

type envKeys = [#VITE_APP_NAME | #VITE_BACKEND]
let getEnvVariable = (key: envKeys) =>
  Js.Dict.get(env, key :> string)->Option.getExn
