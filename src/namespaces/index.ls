require! {
  'react-dom': ReactDom
  'redux': { createStore, combineReducers, applyMiddleware }: Redux
  'react-router-redux': { syncHistoryWithStore }
  'react-router': ReactRouter
  'react-tap-event-plugin': injectTapEventPlugin
  'material-ui/styles': MUIStyles
  'react-redux': ReactRedux

  './store'
  './muiTheme'

  './login/Login'
  './login/Signup'
  './login/ResetPassword'
  './testModule/Incrementor'
  './pages/Home'
  './pages/Portal'
}

{ Router, Route, browserHistory } = engino.createFactory ReactRouter
{ MuiThemeProvider } = engino.createFactory MUIStyles
{ Provider } = engino.createFactory ReactRedux
# Portal = engino.createFactory Portal

history = syncHistoryWithStore browserHistory, store

injectTapEventPlugin!

ReactDom.render do
  Provider { store },
    MuiThemeProvider { muiTheme },
      Router { history },
        Route { path: \/, component: Home }
        Route { path: \rp, component: ResetPassword }
        Route { path: \login, component: Login }
        Route { path: \signup, component: Signup }
        Route { path: \portal, component: Portal },
          Route { path: \login, components: { module: Login } }
          Route { path: \incrementor, components: { module: Incrementor } }

        Route { path: \inc, component: Incrementor }
  document.getElementById \pg