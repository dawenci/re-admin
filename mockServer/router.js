const express = require('express')
const router = express.Router()
const api = require('./api')
const { checkJwtToken } = require('./security')

// 注册
router.post('/api/users', api.user.register)
// 登录
router.post('/api/users/login', api.user.login)
// 获取用户列表
router.get('/api/users', checkJwtToken, api.user.getUsers)
// 获取用户
router.get('/api/user', checkJwtToken, api.user.getUser)
// 更新用户
router.put('/api/user', checkJwtToken, api.user.updateUser)

// 获取转化率
router.get('/api/chart/conversion', checkJwtToken, api.chart.conversion)
// 获取订单数
router.get('/api/chart/orders', checkJwtToken, api.chart.orders)



// TEST
router.get('/api/test/entity', api.test.entity)
router.get('/api/test/list', api.test.list)
router.get('/api/test/timeout', api.test.timeout)
router.get('/api/test/error400', api.test.error400)
router.get('/api/test/error401', api.test.error401)
router.get('/api/test/error403', api.test.error403)
router.get('/api/test/error404', api.test.error404)
router.get('/api/test/error422', api.test.error422)
router.get('/api/test/error500', api.test.error500)
router.get('/api/test/large', api.test.large)

module.exports = router
