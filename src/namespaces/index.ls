require! {
  'react-dom': ReactDom
  
  'react-router': ReactRouter
  
  'material-ui': MUI
  'material-ui/styles': MUIStyles
  
  'redux': { createStore }: Redux
  'react-redux': ReactRedux
  './store'
  './muiTheme'

  './login/Login'
  './login/ResetPassword'
  './testModule/Incrementor'
  './pages/Home'
}

{ Router, Route, Link, IndexRoute, browserHistory } = engino.createFactory ReactRouter
{ RaisedButton, TextField, FlatButton, AppBar} = engino.createFactory MUI
{ MuiThemeProvider } = engino.createFactory MUIStyles
{ Provider } = engino.createFactory ReactRedux

ReactDom.render do
  Provider { store },
    MuiThemeProvider { muiTheme },
      Router { history: browserHistory },
        Route { path: \/, component: Home }
        Route { path: \rp, component: ResetPassword }
        Route { path: \login, component: Login }
        Route { path: \inc, component: Incrementor }
  document.getElementById \pg