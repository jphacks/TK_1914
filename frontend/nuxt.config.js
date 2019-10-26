module.exports = {
    /*
    ** Headers of the page
    */
    head: {
        title: 'becky',
        meta: [
            { charset: 'utf-8' },
            { name: 'viewport', content: 'width=device-width, initial-scale=1' },
            { hid: 'description', name: 'description', content: 'jphack project' }
        ],
        link: [
            { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
        ]
    },
    server: {
        port: 3333, // デフォルト: 3000
        host: '0.0.0.0' // デフォルト: localhost
      },
    /*
    ** Customize the progress bar color
    */
    loading: { color: '#3B8070' },
    /*
    ** Build configuration
    */
    build: {
        /*
        ** Run ESLint on save
        */
        vendor: ['element-ui'],
        extend (config, { isDev, isClient }) {
            if (isDev && isClient) {
                config.module.rules.push({
                    enforce: 'pre',
                    test: /\.(js|vue)$/,
                    loader: 'eslint-loader',
                    exclude: /(node_modules)/
                })
            }
        }
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

