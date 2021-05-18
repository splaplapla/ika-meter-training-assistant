process.env.NODE_ENV = process.env.NODE_ENV || 'development'
const environment = require('./environment')

// https://qiita.com/masahisa/items/eaacb0c3b82f4a11fc13
const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    }),
    new webpack.ProvidePlugin({
        Jcrop: 'jcrop/src/jcrop',
    })
)

module.exports = environment.toWebpackConfig()
