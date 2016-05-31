require! {
  'react': { createClass, { div }: DOM }: React
  'react-dom': ReactDom
  'react-router': ReactRouter
  'material-ui': MUI
  'react-redux': ReactRedux

  './Incrementor.styl': css
}

{ Link } = engino.createFactory ReactRouter
{ RaisedButton } = engino.createFactory MUI
{ connect } = engino.createFactory ReactRedux

mapStateToIncrementorProps = (store) ->
  { number: store[\testModule/counter] }

module.exports = Incrementor = connect(mapStateToIncrementorProps, null) createClass do
  displayName: "Incrementor"

  componentDidMount: ->
    engino.request \incrementor/get
    .then (number) ~>
      @props.dispatch do
        type: \set
        number: number

  render: ->
    RaisedButton do
      label: @props.number + ""
      className: css.incrementorBtn
      onClick: (event) ~>
        engino
        .request \incrementor/update, {inc: true}
        .then (result) ~>
          unless result.success
            @props.dispatch do
              type: \decrement
        @props.dispatch do
          type: \increment