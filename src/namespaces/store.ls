require! {
	# We should import them one by one?
  './testModule/reducer'
  'redux': { createStore }
}

createStore = if window.devToolsExtension
  window.devToolsExtension! createStore
else
  createStore

# combineReducers?
module.exports = store = createStore reducer

# how to make them reload automatically?
# if module.hot?
#   module.hot.accept './reducers', ->
#     nextReducer = require './reducers'
#     store.replaceReducer nextReducer