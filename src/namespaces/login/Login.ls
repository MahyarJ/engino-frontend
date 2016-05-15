require! {
  'react': { createClass, { div }: DOM }: React
  'react-router': ReactRouter
  './Login.styl': css
  'material-ui': MUI
  'material-ui/styles': MUIStyles
}

{ Link, browserHistory } = engino.createFactory ReactRouter
{ RaisedButton, FlatButton, TextField } = engino.createFactory MUI

module.exports = LoginBox = createClass do
  getInitialState: ->
    username: ""
    password: ""
    working: no

  render: ->
    div {className: css.container},
      TextField do
        label: \Username
        fullWidth: true
        floatingLabelText: \Username
        onChange: ~> @setState { username: &1 }

      TextField do
        label: \Password
        fullWidth: true
        floatingLabelText: \Password
        type: \password
        onChange: ~> @setState { password: &1 }

      RaisedButton do
        label: \Login
        secondary: true
        disabled: @state.working
        className: css.button
        onClick: ~>
          @setState { working: yes }
          engino.auth.login @state.username, @state.password
          .then (result) ~>
            @setState { working: no }
            if result?
              browserHistory.push \inc

      Link {to: \rp, activeStyle: {color: \red}},
        FlatButton do
          label: 'Forget Your Password?'
          className: css.button