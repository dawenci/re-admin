
let push: string => unit = location => {
  // TODO, save scroll
  location->ReRouter_History.push
}

let replace: string => unit = location => {
  // TODO, save scroll
  location->ReRouter_History.replace
}
