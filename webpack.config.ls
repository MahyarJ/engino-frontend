require! {
  'path'
}

fromRoot = path.join __dirname, _

module.exports = do ->
  devMode = process.env.NODE_ENV isnt \production

  entry:
    index: [
      'webpack-dev-server/client?http://localhost:8081'
      'webpack/hot/only-dev-server'
      './src/client.ls'
      ]

  devtool: if devMode then \eval

  resolve:
    extensions: ['', '.js', '.ls']

  module:
    loaders:
      * loader: \livescript
        test: /\.ls$/

      * loader: \json
        test: /\.json$/

      * loader: \style
        test: /\.styl$/

      * loader: "css?module" + if devMode then '&sourceMap&localIdentName=[name]_[local]_[hash:base64:3]' else ''
        test: /\.styl$/

      * loader: \stylus
        test: /\.styl$/

      ...

  output:
    path: fromRoot './dist'
    filename: '[name].dist.js'
    publicPath: '/dist/'  # shows the path from .html file till the .js files for script tag

