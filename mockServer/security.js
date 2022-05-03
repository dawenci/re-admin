const { error401 } = require("./res")
const loginUsers = require('./loginUsers')

exports.parseJwtToken = (req, res, next) => {
  const auth = req.header('Authorization')
  if (!auth) return next()

  const jwtToken = auth.split(' ')[1]
  const index = loginUsers.findIndex(item => item.jwtToken === jwtToken)
  if (index === -1) return next()

  const authInfo = loginUsers[index]
  if (Date.now() - authInfo.date > 1000 * 60 * 60) {
    loginUsers.splice(index, 1)
    return next()
  }

  req.authInfo = authInfo
  
  next()
}

exports.checkJwtToken = (req, res, next) => {
  if (!req.authInfo) {
    return error401(res)
  }  
  next()
}
