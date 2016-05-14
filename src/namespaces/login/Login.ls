require! {
  'react': { createClass, createFactory, createElement, DOM }: React
  'react-router': ReactRouter
  './Login.styl': css
  'material-ui': MUI
  'material-ui/styles': MUIStyles
}

{ div } = DOM
{ Link } = engino.createFactory ReactRouter
{ RaisedButton, FlatButton, TextField } = engino.createFactory MUI

module.exports = LoginBox = createClass do
  render: ->
    div {className: css.container},
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
        className: css.button

      Link {to: \rp, activeStyle: {color: \red}},
        FlatButton do
          label: 'Forget Your Password?'
          className: css.button