const loginUsers = require('../loginUsers')

const faker = require('faker')
const { error422, error403, successJson } = require('../res')
faker.locale = 'zh_CN'

exports.conversion = (req, res) => {
  const list = [
    { "month": `9`, "value": .03 },
    { "month": `10`, "value": .04 },
    { "month": `11`, "value": .025 },
    { "month": `12`, "value": .047 },
    { "month": `1`, "value": .055 },
    { "month": `2`, "value": .052 },
    { "month": `3`, "value": .063 },
    { "month": `4`, "value": .043 },
    { "month": `5`, "value": .062 },
    { "month": `6`, "value": .095 },
    { "month": `7`, "value": .071 },
    { "month": `8`, "value": .064 },
  ]
  return successJson(res, 200, {
    list: list
  })
}

exports.orders = (req, res) => {
  const list = [
    { "month": `9`, "value": 1193 },
    { "month": `10`, "value": 1393 },
    { "month": `11`, "value": 1293 },
    { "month": `12`, "value": 1593 },
    { "month": `1`, "value": 1693 },
    { "month": `2`, "value": 1893 },
    { "month": `3`, "value": 2293 },
    { "month": `4`, "value": 2593 },
    { "month": `5`, "value": 2893 },
    { "month": `6`, "value": 3293 },
    { "month": `7`, "value": 3693 },
    { "month": `8`, "value": 3893 },
  ]
  return successJson(res, 200, {
    list: list
  })
}
