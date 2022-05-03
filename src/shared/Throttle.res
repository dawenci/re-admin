let make = (
  func,
  ~wait=?,
  ~leading=true,
  ~trailing=true,
  ~maxWait=?,
  ()
) => {
  let maxWait = switch maxWait {
  | Some(_) as maxWait => maxWait
  | None => wait
  }
  
  Debounce.make(
    func,
    ~wait=?wait,
    ~leading=leading,
    ~trailing=trailing,
    ~maxWait=?maxWait,
    ()
  )
}
