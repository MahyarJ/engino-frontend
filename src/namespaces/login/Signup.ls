require! {
  'react': { createClass, { div }: DOM }: React
  'react-router': ReactRouter
  './Login.styl': css
  'material-ui': MUI
  'material-ui/styles': MUIStyles
}

{ Link, browserHistory } = engino.createFactory ReactRouter
{ RaisedButton, FlatButton, TextField } = engino.createFactory MUI

module.exports = Signup = createClass do
  getInitialState: ->
    username: ""
    password: ""
    confirmPassword: ""
    working: no

  render: ->
    div {className: css.pg},
      div {className: css.bg}
      div {className: css.container},
        TextField do
          label: \Email
          fullWidth: true
          floatingLabelText: \Email
          onChange: ~> @setState { username: &1 }

        TextField do
          label: \Password
          fullWidth: true
          floatingLabelText: \Password
          type: \password
          onChange: ~> @setState { password: &1 }

        TextField do
          label: 'Confirm Password'
          fullWidth: true
          floatingLabelText: 'Confirm Password'
          type: \password
          onChange: ~> @setState { confirmPassword: &1 }

        RaisedButton do
          label: 'Sign Up'
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

        Link {to: \login, activeStyle: {}},
          FlatButton do
            label: 'Return'
            className: css.button
