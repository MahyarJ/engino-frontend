require! {
  'react': { createClass, { div }: DOM }: React
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

  getInitialState: ->
    appModule: Incrementor
  
  render: ->
    div { className: css.container },
      div {className: css.bg}
      div {className: css.app},
        @state.appModule null
      div null,
        Drawer items:
          * text: "Incrementor"
            onClick: ~> @setState appModule: Incrementor
          * text: "Login seriously"
            onClick: ~> @setState appModule: Login