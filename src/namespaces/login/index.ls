require! {
  'react': { createClass, createElement, DOM }: React
  'react-dom': ReactDom
  'react-router': ReactRouter
  'redux': { createStore }: Redux
  './login.styl': css
  'react-tap-event-plugin': injectTapEventPlugin

  'material-ui': MUI
  'material-ui/styles/colors': Colors
  'material-ui/styles/getMuiTheme': getMuiTheme
  'material-ui/styles/MuiThemeProvider': MuiThemeProvider
  'material-ui/styles/baseThemes/darkBaseTheme': darkBaseTheme

  'material-ui/AppBar': AppBar
  'material-ui/RaisedButton': RaisedButton
  'material-ui/FlatButton': FlatButton
  'material-ui/TextField': TextField
}

# injectTapEventPlugin!
getMuiTheme = getMuiTheme.default
MuiThemeProvider = MuiThemeProvider.default
RaisedButton = RaisedButton.default
AppBar = AppBar.default
TextField = TextField.default
FlatButton = FlatButton.default

{ div } = DOM
{ Router, Route, Link, IndexRoute, browserHistory } = engino.createFactory ReactRouter
{ RaisedButton, TextField, FlatButton, AppBar} = engino.createFactory MUI

muiTheme = getMuiTheme do
  isRtl: true
  palette:
    textColor: Colors.pink500

console.log muiTheme

LoginBox = createClass do
  render: ->
    createElement MuiThemeProvider, { muiTheme: getMuiTheme(muiTheme) },
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
          # fullWidth: true
          className: css.forgetPassword

        Link {to: \rp, activeStyle: {color: \red}},
          FlatButton do
            label: 'Forget Your Password?'
            className: css.forgetPassword


ResetPassword = createClass do
  render: ->
    createElement MuiThemeProvider, { muiTheme: getMuiTheme(muiTheme) },
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
    createElement MuiThemeProvider, { muiTheme: getMuiTheme(muiTheme) },
      div {className: css.loginBox},
        Link {to: "/login"},
          RaisedButton do
            # label: 'Go For Login'
            label: 'بریم به لاگین'
            className: css.fa
            secondary: true
            fullWidth: true

Portal = createClass do
  render: ->
    createElement MuiThemeProvider, { muiTheme: getMuiTheme(muiTheme) },
      AppBar { title: 'پنل کاربری' }

ReactDom.render do
  Router { history: browserHistory },
    Route { path: \/, component: Home }
    Route { path: \rp, component: ResetPassword }
    Route { path: \login, component: LoginBox }
    Route { path: \portal, component: Portal }
  document.getElementById \pg
