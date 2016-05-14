require! {
  'react': { createClass, createFactory, createElement, {div}:DOM }: React
  'react-dom': ReactDom
  'react-router': ReactRouter
  'redux': { createStore }: Redux
  './Incrementor.styl': css
  './reducers'

  'material-ui': MUI
  'material-ui/styles': MUIStyles
  'react-redux': ReactRedux
}

{ Router, Route, Link, IndexRoute, browserHistory } = engino.createFactory ReactRouter
{ RaisedButton, TextField, FlatButton, AppBar} = engino.createFactory MUI
{ MuiThemeProvider, getMuiTheme, colors, darkBaseTheme } = engino.createFactory MUIStyles
{ Provider, connect } = engino.createFactory ReactRedux

createStore = if window.devToolsExtension
  window.devToolsExtension! createStore
else
  createStore
store = createStore reducers

if module.hot?
  module.hot.accept './reducers', ->
    nextReducer = require './reducers'
    store.replaceReducer nextReducer

muiTheme = getMuiTheme do
  isRtl: no
  fontFamily: "Iransans, Yekan, Roboto"
  palette:
    textColor: colors.pink900

# Begin awesomeness
engino
.request \incrementor/get
.then (number) ->
  store.dispatch do
    type: \set
    number: number

mapStateToHolderProps = (number) ->
  { number }

Holder = connect(mapStateToHolderProps, null) createClass do
  displayName: "Holder"
  render: ->
    RaisedButton do
      label: @props.number + ""
      className: css.incrementorBtn
      onClick: (event) ~>
        engino
        .request \incrementor/update, {inc: true}
        .then (result) ~>
          unless result.success
            @props.dispatch do
              type: \decrement
        @props.dispatch do
          type: \increment


do render = ->

  ReactDom.render do
    Provider { store },
      MuiThemeProvider { muiTheme },
        createElement Holder, {}

    document.getElementById \pg

# 3) for subscribing into the state changing
store.subscribe ->
  render()

console.log store.getState!