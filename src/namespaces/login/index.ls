require! {
  'react': { createClass, createFactory }: React
  'react-dom': ReactDom
  '../../lib/react': { el, div, h1, h2 }
  'redux': { createStore }: Redux
  './login.styl': css
  '../../lib/material-ui': { RaisedButton, TextField, FlatButton }: MUI
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

ReactDom.render do
  el PG,  {}
  document.getElementById \pg




