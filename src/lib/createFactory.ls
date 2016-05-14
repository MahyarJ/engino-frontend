{ createFactory } = require 'react'

module.exports = engino.createFactory = (Module) ->
  factories = {}
  for key, value of Module
    if key[0] is key[0].toUpperCase! and key[0] isnt \_
      if value.default?
        factories[key] = createFactory value.default
      else
        factories[key] = createFactory value
    else
      if value.default?
        factories[key] = value.default
      else
        factories[key] = value
  factories