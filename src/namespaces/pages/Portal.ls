require! {
  'react': { createClass, createElement, { div }: DOM }: React
  './Portal.styl': css
  '../pageElements/Drawer'
  '../testModule/Incrementor'
  '../login/Login'
}

Drawer = engino.createFactory Drawer
Incrementor = engino.createFactory Incrementor
Login = engino.createFactory Login

module.exports = createClass do
  displayName: \Portal
  # contextTypes:
  #   router: ->
  #     React.PropTypes.func.isRequired

  getInitialState: ->
    appModule: Incrementor

  render: ->
    div { className: css.container },
      div {className: css.bg}
      div {className: css.app},
        @props.module
        # createElement @props.routes?[@props.routes?.length - 1]?.component
      div null,
        Drawer do
          defaultValue: null
          items:
            * key: \incrementor
              text: "Show Incrementor"
              link: \/portal/incrementor
            * key: \login
              text: "Show Login"
              link: \/portal/login
