const { error400, error401, error403, error404, error422, error500, successJson } = require('../res')

exports.entity = (req, res) => {
  successJson(res, 200, {
    entity: {
      number: 1,
      string: "string",
      bool: true,
    }
  })
}

exports.list = (req, res) => {
  successJson(res, 200, {
    list: [{
      number: 1,
      string: "string",
      bool: true,
    }]
  })
}

exports.large = (req, res) => {
  successJson(res, 200, {
    entity: {
      data: Array(100000).fill("LARGE_BODY")
    }
  })
}

exports.timeout = (req, res) => {
  setTimeout(() => {
    successJson(res, 200, {
      entity: null
    })
  }, req.query.delay || 10000)
}

exports.error400 = (req, res) => {
  error400(res)
}

exports.error401 = (req, res) => {
  error401(res)
}

exports.error403 = (req, res) => {
  error403(res)
}

exports.error404 = (req, res) => {
  error404(res)
}

exports.error422 = (req, res) => {
  error422(res)
}

exports.error500 = (req, res) => {
  error500(res)
}
