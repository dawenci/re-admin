type t<'a> =
  | Init
  | Loading
  | Complete('a)
  | Reloading('a)

/* * 构造 Init （未开始）值 */
let init = Init

/* * 构造 Loading （获取中）值 */
let loading = Loading

/* * 构造包含参数的 Complete （已完成）值 */
let complete = x => Complete(x)

/* * 构造包含参数的 Reloading （重新获取中）值 */
let reloading = x => Reloading(x)

/* * 检查异步数据是否为 Init（未开始） */
let isInit = x =>
  switch x {
  | Init => true
  | _ => false
  }

/* * 检查异步数据是否为 Loading （获取中） */
let isLoading = x =>
  switch x {
  | Loading => true
  | _ => false
  }

/* * 检查异步数据是否为 Complete （已完成） */
let isComplete = x =>
  switch x {
  | Complete(_) => true
  | _ => false
  }

/* * 检查异步数据是否为 Reloading （重新获取中） */
let isReloading = x =>
  switch x {
  | Reloading(_) => true
  | _ => false
  }

/* * 检查异步数据是否忙碌状态 （获取中，或重新获取中） */
let isBusy = v =>
  switch v {
  | Loading | Reloading(_) => true
  | _ => false
  }

/* * 检查异步数据是否空闲（未开始，或已完成） */
let isIdle = x =>
  switch x {
  | Complete(_) | Init => true
  | _ => false
  }

let isEmpty = x =>
  switch x {
  | Init | Loading => true
  | _ => false
  }

let isNotEmpty = x =>
  switch x {
  | Complete(_) | Reloading(_) => true
  | _ => false
  }

/* * 切换成忙碌状态 */
let toBusy = x =>
  switch x {
  | Init => Loading
  | Complete(v) => Reloading(v)
  | Loading as x => x
  | Reloading(_) as x => x
  }

/* * 切换成空闲状态 */
let toIdle = x =>
  switch x {
  | Init as x => x
  | Loading => Init
  | Reloading(v) => Complete(v)
  | Complete(_) as x => x
  }

/* * 切换成 Option 类型 */
let toOption = x =>
  switch x {
  | Complete(v) => Some(v)
  | Reloading(v) => Some(v)
  | _ => None
  }

let getComplete = x =>
  switch x {
  | Complete(v) => Some(v)
  | _ => None
  }

let getReloading = x =>
  switch x {
  | Reloading(v) => Some(v)
  | _ => None
  }

/* * 获取值，如果还未有值则抛异常 */
let getExn = x =>
  switch x {
  | Complete(v) => v
  | Reloading(v) => v
  | _ => raise(Not_found)
  }

/* * 获取值，如果还未有值则使用默认值 */
let getWithDefault = (x, default) =>
  switch x {
  | Complete(v) => v
  | Reloading(v) => v
  | Init | Loading => default
  }

/* * 异步数据映射 */
let mapU = (x, f) =>
  switch x {
  | Complete(v) => Complete(f(. v))
  | Reloading(v) => Reloading(f(. v))
  | Loading => Loading
  | Init => Init
  }

/* * 异步数据映射 */
let map = (x, f) =>
  switch x {
  | Complete(v) => Complete(f(v))
  | Reloading(v) => Reloading(f(v))
  | Init => Init
  | Loading => Loading
  }

/* * 异步数据映射 */
let flatMapU = (x, f) =>
  switch x {
  | Complete(v) => f(. v)
  | Reloading(v) => f(. v)
  | Init => Init
  | Loading => Loading
  }

/* * 异步数据映射 */
let flatMap = (x, f) =>
  switch x {
  | Complete(v) => f(v)
  | Reloading(v) => f(v)
  | Init => Init
  | Loading => Loading
  }

let flatten = x => flatMap(x, v => v)

let mapWithDefaultU = (x, default, f) =>
  switch x {
  | Complete(v) => f(. v)
  | Reloading(v) => f(. v)
  | Init | Loading => default
  }

let mapWithDefault = (x, default, f) =>
  switch x {
  | Complete(v) => f(v)
  | Reloading(v) => f(v)
  | Init | Loading => default
  }

let tapEmpty = (x, f) =>
  switch x {
  | Init | Loading =>
    f()
    x
  | _ => x
  }

let tapNotEmpty = (x, f) =>
  switch x {
  | Complete(v) | Reloading(v) =>
    f(v)
    x
  | _ => x
  }

/* * tap 结果值 */
let tapComplete = (x, f) =>
  switch x {
  | Complete(v) =>
    f(v)
    x
  | _ => x
  }

let tapReloading = (x, f) =>
  switch x {
  | Reloading(v) =>
    f(v)
    x
  | _ => x
  }

/* * 判断相等 */
let eqU = (x, y, f) => {
  switch (x, y) {
  | (Complete(vx), Complete(vy)) => f(. vx, vy)
  | (Reloading(vx), Reloading(vy)) => f(. vx, vy)
  | (Loading, Loading)
  | (Init, Init) => true
  | _ => false
  }
}

/* * 判断相等 */
let eq = (x, y, f) => {
  switch (x, y) {
  | (Complete(vx), Complete(vy)) => f(vx, vy)
  | (Reloading(vx), Reloading(vy)) => f(vx, vy)
  | (Loading, Loading)
  | (Init, Init) => true
  | _ => false
  }
}

/* * 比较 */
let cmpU = (x, y, f) =>
  switch (x, y) {
  | (Complete(vx), Complete(vy)) => f(. vx, vy)
  | (Reloading(vx), Reloading(vy)) => f(. vx, vy)
  | (Init, Init)
  | (Loading, Loading) => 0
  | (Complete(_), Reloading(_)) => 1
  | (Complete(_), Loading) => 1
  | (Complete(_), Init) => 1
  | (Reloading(_), Complete(_)) => -1
  | (Reloading(_), Loading) => 1
  | (Reloading(_), Init) => 1
  | (Loading, Complete(_)) => -1
  | (Loading, Reloading(_)) => -1
  | (Loading, Init) => 1
  | (Init, Complete(_)) => -1
  | (Init, Reloading(_)) => -1
  | (Init, Loading) => -1
  }

/* * 比较 */
let cmp = (x, y, f) =>
  switch (x, y) {
  | (Complete(vx), Complete(vy)) => f(vx, vy)
  | (Reloading(vx), Reloading(vy)) => f(vx, vy)
  | (Init, Init)
  | (Loading, Loading) => 0
  | (Complete(_), Reloading(_)) => 1
  | (Complete(_), Loading) => 1
  | (Complete(_), Init) => 1
  | (Reloading(_), Complete(_)) => -1
  | (Reloading(_), Loading) => 1
  | (Reloading(_), Init) => 1
  | (Loading, Complete(_)) => -1
  | (Loading, Reloading(_)) => -1
  | (Loading, Init) => 1
  | (Init, Complete(_)) => -1
  | (Init, Reloading(_)) => -1
  | (Init, Loading) => -1
  }
