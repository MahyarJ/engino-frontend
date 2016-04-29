# This is the example of adding a React object by Redux
# -----------------------------------------------------------
require! {
  'react': { createClass }: React
  'react-dom': ReactDom
  '../../lib/react': { el, div, h1, h2 }
  'redux': { createStore }: Redux
  './incrementor.styl': css
  'material-ui': { RaisedButton }
}

RaisedButton = React.createFactory RaisedButton
# This is the reducer that make the rules
counter = (state = 0, action) ->
  switch action.type
    | \set => action.number
    | \increment => state + 1
    | \decrement => state - 1
    | otherwise  => state

# A store has 3 important methods
# 1) store.getState() --> Returns current state
# 2) store.dispatch( {type: \increment} ) --> most commonly used method lets you dispatch actions
store = createStore counter

engino
.request \incrementor/get
.then (number) ->
  store.dispatch do
    type: \set
    number: number

do render = ->
  # div do
  #   className: css.incrementorBtnOld
  #   children: store.getState()
  ReactDom.render do
    RaisedButton do
      label: store.getState()
      className: css.incrementorBtn
      # primary: true
      onClick: (event) ->
        engino
        .request \incrementor/update, {inc: true}
        .then (result) ->
          unless result.success
            store.dispatch do
              type: \decrement
        store.dispatch do
          type: \increment
    document.getElementById \pg

# 3) for subscribing into the state changing
store.subscribe ->
  render()