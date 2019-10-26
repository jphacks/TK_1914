import Vue from 'vue'
import Router from 'vue-router'
import { interopDefault } from './utils'
import scrollBehavior from './router.scrollBehavior.js'

const _3911577e = () => interopDefault(import('../nuxt-app/pages/profile/_id/index.vue' /* webpackChunkName: "pages/profile/_id/index" */))
const _7c30373c = () => interopDefault(import('../nuxt-app/pages/index.vue' /* webpackChunkName: "pages/index" */))

Vue.use(Router)

export const routerOptions = {
  mode: 'history',
  base: decodeURI('/'),
  linkActiveClass: 'nuxt-link-active',
  linkExactActiveClass: 'nuxt-link-exact-active',
  scrollBehavior,

  routes: [{
    path: "/profile/:id?",
    component: _3911577e,
    name: "profile-id"
  }, {
    path: "/",
    component: _7c30373c,
    name: "index"
  }],

  fallback: false
}

export function createRouter () {
  return new Router(routerOptions)
}
