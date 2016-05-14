require! {
  'react': { createClass, createFactory, createElement, DOM }: React
  'react-dom': ReactDom
  'react-router': ReactRouter
  'redux': { createStore }: Redux
  '../login/Login'
  '../login/ResetPassword'
  # '../testModule/Incrementor'
  './Home'

  'material-ui': MUI
  'material-ui/styles': MUIStyles
}

{ div } = DOM
{ Router, Route, Link, IndexRoute, browserHistory } = engino.createFactory ReactRouter
{ RaisedButton, TextField, FlatButton, AppBar} = engino.createFactory MUI
{ MuiThemeProvider, getMuiTheme, colors, darkBaseTheme } = engino.createFactory MUIStyles

muiTheme = getMuiTheme do
  isRtl: no
  fontFamily: "Iransans, Yekan, Roboto"
  palette:
    textColor: colors.pink900

ReactDom.render do
  MuiThemeProvider { muiTheme },
    Router { history: browserHistory },
      Route { path: \/, component: Home }
      Route { path: \rp, component: ResetPassword }
      Route { path: \login, component: Login }
      Route { path: \inc, component: Incrementor }
  document.getElementById \pg