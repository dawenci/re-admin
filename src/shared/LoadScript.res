@scope(("document")) @val
external createElement: string => 'a = "createElement"

@scope(("document", "head")) @val
external appendToHead: 'a => unit = "appendChild"

@scope(("document", "head")) @val
external removeFromHead: 'a => unit = "removeChild"

@send
external setAttribute: ('a, string, string) => unit = "setAttribute"

let loadScript = (src: string) => {
  Promise.make((resolve, reject) => {
    let script = createElement("script")
    let onload = () => {
      removeFromHead(script)
      resolve(. Ok())
    }
    let onerror = (_) => {
      removeFromHead(script)
      reject(. Error(`Could not load script: ${src}`))
    }
    appendToHead(script)
    script["onload"] = onload
    script["onerror"] = onerror
    script["src"] = src
    ()
  })
}

let loadStyle = (src: string) => {
  Promise.make((resolve, reject) => {
    let link = createElement("link")
    setAttribute(link, "rel", "stylesheet")
    let onload = () => {
      removeFromHead(link)
      resolve(. Ok())
    }
    let onerror = (_) => {
      removeFromHead(link)
      reject(. Error(`Could not load style: ${src}`))
    }
    appendToHead(link)
    link["onload"] = onload
    link["onerror"] = onerror
    link["href"] = src
    ()
  })
}
