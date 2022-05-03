type rAFId
@val external requestAnimationFrame: 'fn => rAFId = "requestAnimationFrame"
@val external cancelAnimationFrame: rAFId => unit = "cancelAnimationFrame"

let setTimeout = Js.Global.setTimeout
let clearTimeout = Js.Global.clearTimeout
let now = () => Js.Date.now()->Belt.Int.fromFloat

type t<'args, 'result> = {
  schedule: 'args => unit,
  cancel: unit => unit,
  pending: unit => bool,
  flush: unit => option<'result>
}

let make = (
  /** 需要调度执行的函数 */
  func: 'args => 'result,
  /** debounce 的等待时间 */
  ~wait=0,
  /** 是否在调度的开始时刻就立即执行 */
  ~leading=false,
  /** 是否在调度的等待时间到达时刻执行 */
  ~trailing=true,
  /** 两次执行之间的最长等待间隔 */
  ~maxWait: option<int>=?,
  ()
) => {
  // 等待时间为 0 的时候，使用 rAF
  let useRAF = wait == 0

  let (maxing, maxWait) = switch maxWait {
  | Some(maxWait) => (true, maxWait)
  | None => (false, 0)
  }

  // 保存最后一次调度时传入的参数
  let lastArgs: ref<option<'args>> = ref(None)
  // 执行的返回值
  let result: ref<option<'result>> = ref(None)  

  // 定时器 id
  let rAFId = ref(None)
  let timerId = ref(None)

  // 上次调用 debounced 的时间点
  let lastCallTime = ref(None)

  // 上次执行 func 的时间点
  let lastInvokeTime = ref(0)

  // 执行
  let invoke = time => {
    let args = lastArgs.contents
    lastArgs := None
    lastInvokeTime := time
    switch args {
    | Some(args) =>
      result := args->func->Some
    | None => ()
    }
  }

  // 判断是否应该调用
  let shouldInvoke = time => {
    switch lastCallTime.contents {
    | Some(lastCallTime) =>
      // 距离上次调用过去了多久
      let timeSinceLastCall = time - lastCallTime
      // 距离上次执行过去了多久
      let timeSinceLastInvoke = time - lastInvokeTime.contents
      // 1. 距离上次调用已经大于等于 wait 设置
      // 2. 设置了 maxWait，并且距离上次执行已经大于等于 maxWait
      // 3. 或者系统时间被回拨到上次调用之前
      timeSinceLastCall >= wait ||
      (maxing && timeSinceLastInvoke >= maxWait) ||
      timeSinceLastCall < 0
    | _ => true // 首次调用
    }
  }

  // 启动定时器
  let startTimer = useRAF
    ? (pendingFunc, _) => {
        switch rAFId.contents {
        | Some(id) => cancelAnimationFrame(id)
        | None => ()
        }
        rAFId := requestAnimationFrame(pendingFunc)->Some
      }
    : (pendingFunc, wait) => {
        timerId := setTimeout(pendingFunc, wait)->Some
      }

  // 取消定时器
  let clearTimer = useRAF
    ? () => {
        switch rAFId.contents {
        | Some(id) => cancelAnimationFrame(id)
        | None => ()
        }
        rAFId := None
      }
    : () => {
        switch timerId.contents {
        | Some(id) => clearTimeout(id)
        | None => ()
        }
        timerId := None
      }

  let pending = useRAF
    ? () => { Belt.Option.isSome(rAFId.contents) }
    : () => { Belt.Option.isSome(timerId.contents) }

  let trailingEdge = (time) => {
    rAFId := None
    timerId := None
    // 在启用 trailing，并且经过至少一次 debounced 的情况（lastArgs 为 Some 时说明已经调度），立即执行
    if (trailing && Belt.Option.isSome(lastArgs.contents)) {
      invoke(time)
    }
    else {
      lastArgs := None
    }
  }

  // 最近一次尝试调用的时间点，距离允许执行的时间差额
  let remainingWait = time => {
    switch lastCallTime.contents {
    | Some(lastCallTime) =>
      let timeSinceLastCall = time - lastCallTime
      let timeSinceLastInvoke = time - lastInvokeTime.contents
      let timeWaiting = wait - timeSinceLastCall
      let maxTimeWaiting = maxWait - timeSinceLastInvoke
      // 如果是有 maxWait 限制，则取剩余的 wait 时间和剩余的 maxWait 中比较小的值，作为继续等待的时间
      maxing ? Js.Math.min_int(timeWaiting, maxTimeWaiting) : timeWaiting
    | None => 0 // Never
    }
  }  

  // 定时器到期
  let rec timerExpired = () => {
    let time = now()
    // 满足执行时间间隔要求了，调用 trailing edge 逻辑
    if shouldInvoke(time) {
      trailingEdge(time)
    } else {
      // 不满足，则以差额为等待时间，继续等待
      startTimer(timerExpired, remainingWait(time))
    }
  }

  let leadingEdge = (time) => {
    // 重置 maxWait 计时
    lastInvokeTime := time
    // 启动 trailing edge 定时器
    startTimer(timerExpired, wait)
    // 执行 leading edge
    if (leading) {
      invoke(time)
    }
  }

  // 最终返回的调度函数
  let debounced: 'args => unit = args => {
    let time = now()
    // 检查时间方面是否满足执行条件了
    let isInvoking = shouldInvoke(time)

    // 保存参数（同时 Some 值在后续的逻辑中代表已经经过调度）
    lastArgs := Some(args)
    
    // 设置最后一次调度的时间
    lastCallTime := Some(time)
    // 时间方面满足执行条件，并且当前没有 pending 的定时器，触发 leading edge 调用
    if isInvoking && !pending() {
      leadingEdge(time)
    }
    // 时间方面满足执行条件，并且设置了 maxWait，启动定时器，立即调用一次，
    else if isInvoking && maxing {
      startTimer(timerExpired, wait)
      invoke(lastCallTime.contents->Belt.Option.getExn)
    }
  
    // 没有定时器，启动一个（有的话，到点会自动执行逻辑）
    else if !pending() {
      startTimer(timerExpired, wait)
    }
  }

  // 刷新结果
  let flush = () => {
    if pending() {
      trailingEdge(now())
    }
    result.contents
  }

  // 取消 debounce 调度
  let cancel = () => {
    clearTimer()
    lastInvokeTime := 0
    lastCallTime := None
    lastArgs := None
  }

  {
    schedule: debounced,
    cancel,
    pending,
    flush
  }
}
