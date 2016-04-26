socket = require 'socket.io-client'
wn = require 'when'
io = socket 'localhost:3000'

requestPromises = {}

io.on \message, (data) ->
  if requestPromises[data.requestKey]?
    requestPromises[data.requestKey].resolve?(data.result)
    delete requestPromises[data.requestKey]

module.exports = engino.request = (fn, params) ->
  requestKey = Math.round(Math.random() * 1000000) + "-" + Date.now()
  wn.promise (resolve, reject) ->
    requestPromises[requestKey] = {resolve, reject}
    io.emit('callee', {fn, params, requestKey})

console.info "You can call engino.request('testModule/test', {name: pouria}).then(function(data){console.log(data);})"