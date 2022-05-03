type t<'a, 'e> = AsyncData.t<result<'a, 'e>>

let init = AsyncData.init
let loading = AsyncData.loading
let completeOk = a => AsyncData.complete(Ok(a))
let completeError = e => AsyncData.complete(Error(e))
let reloadingOk = a => AsyncData.reloading(Ok(a))
let reloadingError = e => AsyncData.reloading(Error(e))
let ok = completeOk
let error = completeError
let isInit = AsyncData.isInit
let isLoading = AsyncData.isLoading
let isComplete = AsyncData.isComplete
let isReloading = AsyncData.isReloading
let isBusy = AsyncData.isBusy
let isIdle = AsyncData.isIdle
let isEmpty = AsyncData.isEmpty
let isNotEmpty = AsyncData.isNotEmpty
let toBusy = AsyncData.toBusy
let toIdle = AsyncData.toIdle
let tapComplete = AsyncData.tapComplete
let tapReloading = AsyncData.tapReloading
let tapEmpty = AsyncData.tapEmpty
let tapNotEmpty = AsyncData.tapNotEmpty

let fromAsyncData = x => AsyncData.map(x, v => Ok(v))

let toAsyncData = x =>
  switch x {
  | AsyncData.Init => AsyncData.Init
  | AsyncData.Loading => AsyncData.Loading
  | AsyncData.Complete(Ok(v))
  | AsyncData.Complete(Error(v)) =>
    AsyncData.Complete(v)
  | AsyncData.Reloading(Ok(v))
  | AsyncData.Reloading(Error(v)) =>
    AsyncData.Reloading(v)
  }

let isCompleteOk = x =>
  switch x {
  | AsyncData.Complete(Ok(_)) => true
  | _ => false
  }

let isReloadingOk = x =>
  switch x {
  | AsyncData.Reloading(Ok(_)) => true
  | _ => false
  }

let isOk = x =>
  switch x {
  | AsyncData.Complete(Ok(_))
  | AsyncData.Reloading(Ok(_)) => true
  | _ => false
  }

let isCompleteError = x =>
  switch x {
  | AsyncData.Complete(Error(_)) => true
  | _ => false
  }

let isReloadingError = x =>
  switch x {
  | AsyncData.Reloading(Error(_)) => true
  | _ => false
  }

let isError = x =>
  switch x {
  | AsyncData.Complete(Error(_))
  | AsyncData.Reloading(Error(_)) => true
  | _ => false
  }

let getOk = e =>
  switch e {
  | AsyncData.Complete(Ok(v)) => Some(v)
  | AsyncData.Reloading(Ok(v)) => Some(v)
  | _ => None
  }

let getError = x =>
  switch x {
  | AsyncData.Complete(Error(e)) => Some(e)
  | AsyncData.Reloading(Error(e)) => Some(e)
  | _ => None
  }

let getCompleteOk = x =>
  switch x {
  | AsyncData.Complete(Ok(v)) => Some(v)
  | _ => None
  }

let getCompleteError = x =>
  switch x {
  | AsyncData.Complete(Error(e)) => Some(e)
  | _ => None
  }

let getReloadingOk = x =>
  switch x {
  | AsyncData.Reloading(Ok(v)) => Some(v)
  | _ => None
  }

let getReloadingError = x =>
  switch x {
  | AsyncData.Reloading(Error(e)) => Some(e)
  | _ => None
  }

let map = (x, f) =>
  switch x {
  | AsyncData.Init => AsyncData.Init
  | AsyncData.Loading => AsyncData.Loading
  | AsyncData.Complete(Ok(v)) => completeOk(f(v))
  | AsyncData.Complete(Error(_)) as r => r
  | AsyncData.Reloading(Ok(v)) => reloadingOk(f(v))
  | AsyncData.Reloading(Error(_)) as r => r
  }

let mapError = (x, f) =>
  switch x {
  | AsyncData.Init => AsyncData.Init
  | AsyncData.Loading => AsyncData.Loading
  | AsyncData.Complete(Ok(_)) as r => r
  | AsyncData.Complete(Error(e)) => completeError(f(e))
  | AsyncData.Reloading(Ok(_)) as r => r
  | AsyncData.Reloading(Error(e)) => reloadingError(f(e))
  }

let flatMap = (x, f) =>
  switch x {
  | AsyncData.Init => AsyncData.Init
  | AsyncData.Loading => AsyncData.Loading
  | AsyncData.Complete(Ok(v)) => f(v)
  | AsyncData.Complete(Error(_)) as r => r
  | AsyncData.Reloading(Ok(v)) => f(v)
  | AsyncData.Reloading(Error(_)) as r => r
  }

let flatten = x => flatMap(x, v => v)

let tapOk = (x, f) =>
  switch x {
  | AsyncData.Complete(Ok(v))
  | AsyncData.Reloading(Ok(v)) =>
    f(v)
    x
  | _ => x
  }

let tapError = (x, f) =>
  switch x {
  | AsyncData.Complete(Error(e))
  | AsyncData.Reloading(Error(e)) =>
    f(e)
    x
  | _ => x
  }
