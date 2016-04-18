# This is the example of adding a React object by Redux
# -----------------------------------------------------------
require! {
  'react': { createClass }: React
  'react-dom': ReactDom
  '../../lib/react': { el, div, h1, h2 }
  'redux': { createStore }: Redux
}

counter = (state = 0, action) ->
  switch action.type
    | \increment => state + 1
    | \decrement => state - 1
    | otherwise  => state

# A store has 3 important methods
store = createStore counter

# 1) Returns current state
console.log \currnetState, store.getState()

# 2) most commonly used method lets you dispatch actions
store.dispatch do
  type: \increment

console.log \newState, store.getState()

do render = ->
  ReactDom.render do
    div do
      children: store.getState()
      onClick: (event) ->
        store.dispatch do
          type: \increment
    document.getElementById \pg

# 3) for subscribing into the state changing
store.subscribe ->
  render()

