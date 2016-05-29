require! {
  # './testModule/counter.reducer': reducer
  'redux': { createStore, combineReducers }
  'react-router-redux': { routerReducer }
}

createStore = if window.devToolsExtension
  window.devToolsExtension! createStore
else
  createStore

requireAll = (requireContext) ->
  helpers = {}
  for filename in requireContext.keys!
    name = filename.replace(/^\.\//, '').replace(/\.ls$/, '').replace(".reducer", "")
    helpers[name] = requireContext filename
  helpers

getCombinedReducers = ->
  requireContext = require.context './', true, /reducer\.ls$/
  reducers = requireAll requireContext
  combinedReducers = combineReducers do
    ...reducers
    routing: routerReducer
  { id: requireContext.id, combinedReducers }

{ id, combinedReducers } = getCombinedReducers!
module.exports = store = createStore combinedReducers

if module.hot?
  module.hot.accept id, ->
    # https://github.com/webpack/webpack/issues/834#issuecomment-76590576
    store.replaceReducer getCombinedReducers!.combinedReducers