require! {
  'react': { createClass, { div }: DOM }: React
  './Portal.styl': css
  '../pageElements/Drawer'
  '../testModule/Incrementor'
}

Drawer = engino.createFactory Drawer
Incrementor = engino.createFactory Incrementor

module.exports = createClass do
  displayName: \Portal
  
  render: ->
    div { className: css.container },
      div {className: css.bg}
      div {className: css.app},
        Incrementor null
      div null,
        Drawer null