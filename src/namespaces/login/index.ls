require! {
  'react': { createClass, createFactory, createElement }: React
  'react-dom': ReactDom
  '../../lib/react': { el, div, h1, h2, rtr, rt }
  'redux': { createStore }: Redux
  './login.styl': css
  '../../lib/material-ui': { RaisedButton, TextField, FlatButton }: MUI

  'react-router': { Router, Route, Link, IndexRoute, browserHistory, hashHistory, Link }: ReactRouter
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

        createElement Link, {to: \rp, activeStyle: {color: \red}},
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
    React.DOM.div do
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
  * path: \/
    component: PG  # This is the component that appears at first
    # indexRoute:
    #   component: PG
    # childRoutes:
    #   * path: \rp
    #     component: ResetPassword
    #   * path: \home
    #     component: Home

  * path: \rp
    component: ResetPassword
  ...

ReactDom.render do
  el Router, { history: browserHistory },
    el Route, { path: \/, component: PG }
    el Route, { path: \rp, component: ResetPassword }

  # rtr { history: browserHistory },
  #   rt { path: \/, component: PG }
  #   rt { path: \rp, component: ResetPassword }

  document.getElementById \pg
