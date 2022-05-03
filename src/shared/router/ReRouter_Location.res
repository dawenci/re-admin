// {
//   /* path takes window.location.path, like "/book/title/edit" and turns it into `["book", "title", "edit"]` */
//   path: list<string>,
//   /* the url's hash, if any. The # symbol is stripped out for you */
//   hash: string,
//   /* the url's query params, if any. The ? symbol is stripped out for you */
//   search: string,
// }
type t = {
  path: list<string>,
  hash: string,
  search: string,
}

let useLocation: unit => t = () => {
  let url = RescriptReactRouter.useUrl()
  {
    path: url.path,
    hash: url.hash,
    search: url.search,
  }
}
