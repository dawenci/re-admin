let secondInMs = 1000
let minuteInMs = 60 * secondInMs
let hourInMs = 60 * minuteInMs
let dayInMs = 24 * hourInMs
let monthInMs = 30 * dayInMs

let formatDate: Js.Date.t => string = date => {
  let yyyy = date->Js.Date.getFullYear->Int.fromFloat->Int.toString
  let mm = date->Js.Date.getMonth->Int.fromFloat->Int.toString
  let dd = date->Js.Date.getDate->Int.fromFloat->Int.toString

  `${yyyy}/${mm}/${dd}`
}
