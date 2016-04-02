require! {
  'socket.io-client'
  'react': React
  'react-dom': ReactDom
}

name = \Developer

io = socket 'localhost:3000'
io.on \message, (data) ->
  console.log data
  io.emit \message,
    name: name
    body: 'Got it!'

App = React.createClass do
  displayName: \App
  render: ->
    React.createElement \div,
      className: "clickable"
      children: "Click Me"
      onClick: (event) ->
        console.log \Clicked, event

ReactDom.render React.createElement(App, {}), document.getElementById('pg')

# Now, in the client and developer tool you just can type this:
# soc.emit('message', {name: 'Mahyar', body: 'Hi'})
window.soc = io