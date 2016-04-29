window.engino = {}

require! {
  # 'react': {createClass}: React
  # 'react-dom': ReactDom
  # 'redux': { createStore }: Redux
  # './lib/react': {el, div, h1, h2}
  './lib/request'
  './lib/auth'
  'react-tap-event-plugin': injectTapEventPlugin
}
injectTapEventPlugin()

# now everything is ready for namespaces
require! {
  './namespaces/testModule/incrementor'
}

# name = \Developer

# io.on \message, (data) ->
#   console.log data
#   io.emit \message,
#     name: name
#     body: 'Got it!'

# Now, in the client and developer tool you just can type this:
# soc.emit('message', {name: 'Mahyar', body: 'Hi'})
# window.soc = io