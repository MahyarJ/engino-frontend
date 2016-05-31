require! {
  'react': { createClass, { div }: DOM }: React
  'react-router': ReactRouter
  './Login.styl': css
  'material-ui': MUI
  'material-ui/styles': MUIStyles
}

{ Link } = engino.createFactory ReactRouter
{ RaisedButton, FlatButton, TextField } = engino.createFactory MUI

module.exports = createClass do
  contextTypes:
    router: ->
      React.PropTypes.func.isRequired

  render: ->
    div {className: css.pg},
      div {className: css.bg}
      div {className: css.container},
        TextField do
          label: 'Username or Email'
          fullWidth: true
          floatingLabelText: 'Username or Email'

        RaisedButton do
          label: 'Send Reset Password Email'
          primary: true
          fullWidth: true
          className: css.button

        # Link {to: "/login"},
        FlatButton do
          label: 'Return'
          className: css.button
          onClick: ~>
            @context.router.push \login