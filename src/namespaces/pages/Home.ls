require! {
  'react': { createClass, { div }: DOM }: React
  'react-router': ReactRouter
  './Home.styl': css
  'material-ui': MUI
  'material-ui/styles': MUIStyles
}

{ Link } = engino.createFactory ReactRouter
{ RaisedButton } = engino.createFactory MUI

module.exports = Home = createClass do
  render: ->
    div {className: css.loginBox},
      Link {to: "/login"},
        RaisedButton do
          # label: 'Go For Login'
          label: 'بریم به لاگین'
          className: css.button
          secondary: true
          fullWidth: true