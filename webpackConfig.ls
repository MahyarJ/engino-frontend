require! {
  'path'
  'browser-sync-webpack-plugin': BrowserSyncPlugin
}

module.exports = ({projectDir, index}) ->
  devMode = process.env.NODE_ENV isnt \production

  entry:
    index:
      if devMode
        'webpack-dev-server/client?http://localhost:' + process.env.PORT
        'webpack/hot/only-dev-server'
        index
      else
        [index]

  devtool: if devMode then \eval

  resolve:
    extensions: ['', '.js', '.ls']
    fallback:
      [ path.join(__dirname, \node_modules) ]
    alias:
      '$ens': path.join __dirname, 'src/namespaces'
      '$engino': path.join __dirname, './'
      '$ns': path.join projectDir, 'src/namespaces'

  plugins:
    * new BrowserSyncPlugin do
        {
          host:  'localhost'
          port:  process.env.PORT
          proxy: 'http://localhost:' + process.env.PORT + '/'
        }
        {
          reload: no
        }
    ...

  output:
    path: path.join projectDir, './dist'
    filename: '[name].dist.js'
    publicPath: '/dist/'  # shows the path from .html file till the .js files for script tag

  resolveLoader:
    root:
      path.join __dirname, \node_modules
      path.join projectDir, \node_modules

  module:
    loaders:
      * loader: if devMode then \react-hot!livescript else \livescript
        test: /\.ls$/

      * loader: \json
        test: /\.json$/

      * loader: \style
        test: /\.styl$/

      * loader: "css?module" + if devMode then '&sourceMap&localIdentName=[name]_[local]_[hash:base64:3]' else ''
        test: /\.styl$/

      * loader: \stylus
        test: /\.styl$/

      * loader: 'url-loader'
        test: /\.(woff|otf|ttf|png|gif|jpg)$/

