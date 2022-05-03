const express = require('express')
const bodyParser = require('body-parser')
const compression = require('compression')
const morgan = require('morgan')
const cors = require('cors')
const http = require('http')

const app = express()
const port = 3001
const router = require('./router')
const { error404 } = require('./res')
const { parseJwtToken } = require('./security')

// Compression
app.use(compression())
// Logger
app.use(morgan('dev'))
// Enable CORS
app.use(cors())
// POST, PUT, DELETE body parser
app.use(bodyParser.json({ limit: '20mb' }))
app.use(
  bodyParser.urlencoded({
    limit: '20mb',
    extended: false
  })
)
// No cache
app.use((req, res, next) => {
  res.header('Cache-Control', 'private, no-cache, no-store, must-revalidate')
  res.header('Pragma', 'no-cache')
  res.header('Expires', '-1')
  next()
})

app.use(parseJwtToken)
app.use(router)

// Catch 404 error
app.use((req, res, next) => {
  error404(res)
})

// Create HTTP server.
const server = http.createServer(app)

// Listen on provided port, on all network interfaces.
server.listen(port)
server.on('error', onError)
console.log('Mock server started on port ' + port + '!')

// Event listener for HTTP server "error" event.
function onError(error) {
  if (error.syscall !== 'listen') {
    throw error
  }
  const bind = typeof port === 'string' ? 'Pipe ' + port : 'Port ' + port
  // handle specific listen errors with friendly messages
  switch (error.code) {
    case 'EACCES': {
      console.error('Express ERROR (app) : %s requires elevated privileges', bind)
      process.exit(1)
      break
    }

    case 'EADDRINUSE': {
      console.error('Express ERROR (app) : %s is already in use', bind)
      process.exit(1)
      break
    }

    default:
      throw error
  }
}
