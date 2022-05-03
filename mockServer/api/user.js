const loginUsers = require('../loginUsers')

const faker = require('faker')
const { error422, error403, successJson } = require('../res')
faker.locale = 'zh_CN'

let tokenIndex = 0
let idIndex = 0

const userStore = [
  {
    id: String(++idIndex),
    roles: ['admin'],
    createdAt: new Date(),
    updatedAt: new Date(),

    email: 'admin@readmin.com',
    password: 'admin',
    username: 'amdin',
    nickname: 'admin',
    bio: 'Administrator',
    image: null,
  },
]

;['Alice', 'Bob', 'Charlie', 'Dave', 'Eve', 'Frank', 'Grace', 'Heidi', 'Judy', 'Michael', 'Niaj', 'Oscar', 'Peggy', 'Sybil', 'Ted', 'Victor', 'Walter', 'Wendy'].forEach(nickname => {
  const username = nickname.toLowerCase()
  const password = username
  const email = `${username}@readmin.com`
  const bio = nickname
  userStore.push({
    id: String(++idIndex),
    roles: ['user'],
    createdAt: new Date(),
    updatedAt: new Date(),

    email,
    password,
    username,
    nickname,
    bio,
    image: null,
  })
})


exports.register = (req, res) => {
  const { username, email, password } = req.body.user

  if (!username || !email || !password) {
    return error422(res)
  }

  if (userStore.find(user => user.username === username || user.email === email)) {
    return error403(res)
  }

  userStore.push({
    id: String(++idIndex),
    roles: ['user'],
    createdAt: new Date(),
    updatedAt: new Date(),

    email,
    password,
    username,
    nickname: username,
    bio: '',
    image: null
  })

  return exports.login(req, res)
}

exports.login = (req, res) => {
  const { email, password } = req.body.user
  const user = userStore.find(user => user.email === email && user.password === password)
  if (!user) {
    return error403(res)
  }

  const jwtToken = `jwt.token.here${++tokenIndex}`

  loginUsers.push({
    user,
    date: Date.now(),
    jwtToken,
  })

  return successJson(res, 200, {
    entity: {
      token: jwtToken,
      id: user.id,
      roles: user.roles,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
      email: user.email,
      username: user.username,
      nickname: user.nickname,
      bio: user.bio,
      image: user.image
    }
  })
}

exports.getUser = (req, res) => {
  const { jwtToken, user } = req.authInfo

  return successJson(res, 200, {
    entity: {
      token: jwtToken,
      id: user.id,
      roles: user.roles,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
      email: user.email,
      username: user.username,
      nickname: user.nickname,
      bio: user.bio,
      image: user.image
    }
  })
}

exports.updateUser = (req, res) => {
  const { jwtToken, user } = req.authInfo
  const payload = req.body.user 

  Object.assign(user, {
    email: payload.email,
    bio: payload.bio,
    image: payload.image
  })

  return successJson(res, 200, {
    entity: {
      token: jwtToken,
      id: user.id,
      roles: user.roles,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
      email: user.email,
      username: user.username,
      nickname: user.nickname,
      bio: user.bio,
      image: user.image
    }
  })
}

exports.getUsers = (req, res) => {
  const list = userStore
  .map(item => {
    item = JSON.parse(JSON.stringify(item))
    delete item.password
    return item
  })
  .filter(item => {
    const { username, nickname, bio, id, role, email } = req.query
    if (username && !item.username.includes(username)) return false
    if (nickname && !item.nickname.includes(nickname)) return false
    if (bio && !item.bio.includes(bio)) return false
    if (id && !item.id.includes(id)) return false
    if (role && !item.role.includes(role)) return false
    if (email && !item.email.includes(email)) return false
    return true
  })

  return successJson(res, 200, {
    page: 1,
    pageSize: 10,
    totalCount: list.length,
    list: list
  })
}
