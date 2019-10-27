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
        '~plugins/element-ui',
        '~plugins/axios.js',
        '~/plugins/cookie-storage.js',
    ],
    router: {
        middleware: 'user'
    },
    css: [
        'element-ui/lib/theme-chalk/index.css'
    ],
    modules: [
        '@nuxtjs/axios',
        '@nuxtjs/style-resources',
        'nuxt-clipboard2'
    ],
    styleResources: {
        scss: [
            '~/assets/scss/variable.scss',
            '~/assets/scss/mixin.scss',
            '~/assets/scss/common.scss',
        ]
    }
}