{ createFactory } = require 'react'

module.exports = engino.createFactory = (Module) ->
  factories = {}
  for key, value of Module
    if key[0] is key[0].toUpperCase! and key[0] isnt \_
      factories[key] = createFactory value
    else
      factories[key] = value
  factories