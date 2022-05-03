type val = [
  | #Val(option<string>)
  | #Arr(array<option<string>>)
]

type t = Js.Dict.t<val>

let empty = Js.Dict.empty

let fromString: string => t = queryString => {
  let res = Js.Dict.empty()
  let queryString = queryString->Js.String2.trim->Js.String2.replaceByRe(%re("/^(\?|#|&)/"), "")
  if queryString == "" {
    res
  } else {
    queryString
    ->Js.String2.split("&")
    ->Js.Array2.forEach(param => {
      let parts = param->Js.String2.replaceByRe(%re("/\+/g"), " ")->Js.String2.split("=")

      let key = parts->Js.Array2.shift->Option.getExn->ReRouter_EncodeDecode.decode
      let val =
        parts->Js.Array2.length > 0
          ? parts->Js.Array2.joinWith("")->ReRouter_EncodeDecode.decode->Some
          : None

      switch Js.Dict.get(res, key) {
      // 已经存在键值对，则值转换成数组
      | Some(#Val(existingVal)) => res->Js.Dict.set(key, #Arr([existingVal, val]))
      // 已存在键值对数组，则更新数组
      | Some(#Arr(existingVal)) => existingVal->Js.Array2.push(val)->ignore
      // 不存在则插入键值对
      | None => res->Js.Dict.set(key, #Val(val))
      }
    })
    res
  }
}

let toString: t => string = queryObj => {
  let res =
    queryObj
    ->Js.Dict.keys
    ->Js.Array2.map(key => {
      switch queryObj->Js.Dict.get(key) {
      | Some(#Arr(val)) =>
        let result = []
        val->Js.Array2.forEach(val2 => {
          switch val2 {
          | None => result->Js.Array2.push(key->ReRouter_EncodeDecode.encode)->ignore
          | Some(val2) =>
            result
            ->Js.Array2.push(
              key->ReRouter_EncodeDecode.encode ++ "=" ++ val2->ReRouter_EncodeDecode.encode,
            )
            ->ignore
          }
        })
        result->Js.Array2.joinWith("&")
      | Some(#Val(val)) =>
        switch val {
        | Some(val) => key->ReRouter_EncodeDecode.encode ++ "=" ++ val->ReRouter_EncodeDecode.encode
        | None => key->ReRouter_EncodeDecode.encode
        }
      | None => key->ReRouter_EncodeDecode.encode
      }
    })
    ->Js.Array2.filter(x => x->Js.String2.length > 0)
    ->Js.Array2.joinWith("&")

  `?${res}`
}

let resolve: (string, ~extraQuery: option<t>=?, unit) => t = (
  queryString,
  ~extraQuery=None,
  (),
) => {
  let obj = fromString(queryString)
  switch extraQuery {
  | Some(extra) =>
    extra
    ->Js.Dict.keys
    ->Js.Array2.forEach(key => {
      let extraVal = extra->Js.Dict.get(key)
      switch extraVal {
      | Some(val) => obj->Js.Dict.set(key, val)
      | None => obj->Js.Dict.set(key, #Val(None))
      }
    })
    obj
  | None => obj
  }
}
