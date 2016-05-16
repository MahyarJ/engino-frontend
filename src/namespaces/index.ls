require! {
  'react-dom': ReactDom

  'react-router': ReactRouter

  'material-ui/styles': MUIStyles

  'react-redux': ReactRedux
  './store'
  './muiTheme'

  './login/Login'
  './login/Signup'
  './login/ResetPassword'
  './testModule/Incrementor'
  './pages/Home'
}

{ Router, Route, browserHistory } = engino.createFactory ReactRouter
{ MuiThemeProvider } = engino.createFactory MUIStyles
{ Provider } = engino.createFactory ReactRedux

ReactDom.render do
  Provider { store },
    MuiThemeProvider { muiTheme },
      Router { history: browserHistory },
        Route { path: \/, component: Home }
        Route { path: \rp, component: ResetPassword }
        Route { path: \login, component: Login }
        Route { path: \signup, component: Signup }
        Route { path: \inc, component: Incrementor }
  document.getElementById \pg