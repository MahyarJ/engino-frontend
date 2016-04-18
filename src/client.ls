require! {
  'socket.io-client'
  # 'react': {createClass}: React
  # 'react-dom': ReactDom
  # 'redux': { createStore }: Redux
  # './lib/react': {el, div, h1, h2}
  './namespaces/testModule/incrementor'
}

name = \Developer

io = socket 'localhost:3000'
io.on \message, (data) ->
  console.log data
  io.emit \message,
    name: name
    body: 'Got it!'

# Now, in the client and developer tool you just can type this:
# soc.emit('message', {name: 'Mahyar', body: 'Hi'})
window.soc = io