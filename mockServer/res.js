
exports.successJson = (res, status, data, message = "OK") => {
  let json = JSON.stringify({ data, message })
  let contentLenth = Buffer.byteLength(json)
  res.set({
    'Content-Type': 'application/json; charset=utf-8',
    // 'Content-Length': contentLenth,
  })
  res.status(status)
  res.send(json)
  return res
}

exports.errorJson = (res, status, errors, message = "Error") => {
  const json = { errors, message }
  return res.status(status).json(json)
}

exports.error422 = (res) => {
  return exports.errorJson(
    res,
    422,
    [{ message: "can't be empty" }],
    "can't be empty"
  )
}

exports.error401 = (res, message = ["Unauthorized"]) => {
  return exports.errorJson(
    res,
    401,
    [{ message: "Unauthorized" }],
    "Unauthorized"
  )
}

exports.error403 = (res, message = ["Forbidden"]) => {
  return exports.errorJson(
    res,
    403,
    [{ message: "Forbidden" }],
    "Forbidden"
  )
}

exports.error404 = (res, message = ["Not found"]) => {
  return exports.errorJson(
    res,
    404,
    [{ message: "Not found" }],
    "Not found"
  )
}
