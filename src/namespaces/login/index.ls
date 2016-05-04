require! {
  'react': { createClass, createFactory }: React
  'react-dom': ReactDom
  '../../lib/react': { el, div, h1, h2 }
  'redux': { createStore }: Redux
  './login.styl': css
  '../../lib/material-ui': { RaisedButton, TextField, FlatButton }: MUI

  'react-router': { Router, Route, Link, browserHistory, hashHistory }: ReactRouter
}

PG = createClass do
  render: ->
    div do
      className: css.pg
      children:
        el LoginBox, {}

LoginBox = createClass do
  # componentWillMount: ->
  #   newMuiTheme = @state.muiTheme
  #   newMuiTheme.isRtl = true

  render: ->
    div do
      className: css.loginBox
      children:
        TextField do
          label: \Username
          fullWidth: true
          floatingLabelText: \Username

        TextField do
          label: \Password
          type: \password
          fullWidth: true
          floatingLabelText: \Password

        RaisedButton do
          label: \Login
          secondary: true
          fullWidth: true

        FlatButton do
          label: 'Forget Your Password?'
          className: css.forgetPassword

ResetPassword = createClass do
  render: ->
    div do
      className: css.loginBox
      children:
        TextField do
          label: 'Username or Email'
          fullWidth: true
          floatingLabelText: 'Username or Email'

        RaisedButton do
          label: 'Send Reset Password Email'
          primary: true
          fullWidth: true

        FlatButton do
          label: 'Return'
          className: css.forgetPassword

Home = createClass do
  render: ->
    div do
      className: css.loginBox
      children:
        RaisedButton do
          label: 'Go For Login'
          secondary: true
          fullWidth: true


# ReactDom.render do
#   el LoginBox,  {}
#   document.getElementById \pg


routes =
  path: \/
  component: PG  # This is the component that appears at first
  # indexRoute:
  #   component: PG
  childRoute:
    * path: \rp
      component: ResetPassword
    * path: \home
      component: Home

ReactDom.render do
  el Router,
    history: browserHistory
    routes: routes

  document.getElementById \pg
