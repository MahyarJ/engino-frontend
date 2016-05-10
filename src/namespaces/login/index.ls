require! {
  'react': { createClass, DOM }: React
  'react-dom': ReactDom
  'redux': { createStore }: Redux
  './login.styl': css
  'react-router': ReactRouter
  'material-ui': MUI
}
{ div } = DOM
{ Router, Route, Link, IndexRoute, browserHistory } = engino.createFactory ReactRouter
{ RaisedButton, TextField, FlatButton } = engino.createFactory MUI

LoginBox = createClass do
  render: ->
    div {className: css.loginBox},
      TextField do
        label: \Username
        fullWidth: true
        floatingLabelText: \Username

      TextField do
        label: \Password
        fullWidth: true
        floatingLabelText: \Password

      RaisedButton do
        label: \Login
        secondary: true
        fullWidth: true

      Link {to: \rp, activeStyle: {color: \red}},
        FlatButton do
          label: 'Forget Your Password?'
          className: css.forgetPassword


ResetPassword = createClass do
  render: ->
    div {className: css.loginBox},
      TextField do
        label: 'Username or Email'
        fullWidth: true
        floatingLabelText: 'Username or Email'

      RaisedButton do
        label: 'Send Reset Password Email'
        primary: true
        fullWidth: true

      Link {to: "/login"}, 
        FlatButton do
          label: 'Return'
          className: css.forgetPassword

Home = createClass do
  render: ->
    div {className: css.loginBox},
      Link {to: "/login"}, 
        RaisedButton do
          label: 'Go For Login'
          secondary: true
          fullWidth: true



ReactDom.render do
  Router { history: browserHistory },
    Route { path: \/, component: Home }
    Route { path: \rp, component: ResetPassword }
    Route { path: \login, component: LoginBox }

  document.getElementById \pg
