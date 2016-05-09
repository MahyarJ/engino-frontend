require! {
  'react': { createClass, createElement, DOM }: React
  'react-dom': ReactDom
  'redux': { createStore }: Redux
  './login.styl': css
  'material-ui': {
    RaisedButton
    TextField
    FlatButton
  }
  'react-router': { Router, Route, Link, IndexRoute, browserHistory }: ReactRouter
}


LoginBox = createClass do
  render: ->
    DOM.div {className: css.loginBox},
      createElement TextField,
        label: \Username
        fullWidth: true
        floatingLabelText: \Username

      createElement TextField,
        label: \Password
        fullWidth: true
        floatingLabelText: \Password

      createElement RaisedButton,
        label: \Login
        secondary: true
        fullWidth: true

      createElement Link, {to: \rp, activeStyle: {color: \red}},
        createElement FlatButton,
          label: 'Forget Your Password?'
          className: css.forgetPassword


ResetPassword = createClass do
  render: ->
    DOM.div {className: css.loginBox},
      createElement TextField,
        label: 'Username or Email'
        fullWidth: true
        floatingLabelText: 'Username or Email'

      createElement RaisedButton,
        label: 'Send Reset Password Email'
        primary: true
        fullWidth: true

      createElement Link, {to: "/login"}, 
        createElement FlatButton,
          label: 'Return'
          className: css.forgetPassword

Home = createClass do
  render: ->
    DOM.div {className: css.loginBox},
      createElement Link, {to: "/login"}, 
        createElement RaisedButton,
          label: 'Go For Login'
          secondary: true
          fullWidth: true



ReactDom.render do
  createElement Router, { history: browserHistory },
    createElement Route, { path: \/, component: Home }
    createElement Route, { path: \rp, component: ResetPassword }
    createElement Route, { path: \login, component: LoginBox }

  document.getElementById \pg
