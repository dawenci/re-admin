%%raw(`
import marked from 'marked'
import createDOMPurify from 'dompurify'
const DOMPurify = createDOMPurify(window)
`)

let markdownToHtml: string => string = %raw(`function markdownToHtml(markdown) { return DOMPurify.sanitize(marked(markdown)) }`)
