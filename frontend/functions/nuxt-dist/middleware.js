const middleware = {}

middleware['user'] = require('../nuxt-app/middleware/user.js')
middleware['user'] = middleware['user'].default || middleware['user']

export default middleware
