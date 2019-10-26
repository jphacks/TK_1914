module.exports = {
    head: {
        title: 'Q-me',
        meta: [
            { charset: 'utf-8' },
            { name: 'viewport', content: 'width=device-width, initial-scale=1' },
            { hid: 'description', name: 'description', content: 'jphack project' }
        ],
        link: [
            { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
        ]
    },
    srcDir: 'nuxt-app',
    buildDir: 'nuxt-dist',
    build: {
      publicPath: '/assets/',
    },
    plugins: [
        '~plugins/element-ui'
    ],
    css: [
        'element-ui/lib/theme-chalk/index.css'
    ],
    modules: ['@nuxtjs/style-resources'],
    styleResources: {
        scss: [
            '~/assets/scss/variable.scss',
            '~/assets/scss/mixin.scss',
            '~/assets/scss/common.scss',
        ]
    }
}