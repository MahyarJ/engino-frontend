window.engino = {}

require! {
  # 'react': {createClass}: React
  # 'react-dom': ReactDom
  # 'redux': { createStore }: Redux
  # './lib/react': {el, div, h1, h2}
  './lib/request'
  './lib/auth'
  'react-tap-event-plugin': injectTapEventPlugin
  # './namespaces/testModule/incrementor'
  './namespaces/login'
}

injectTapEventPlugin()
