require! {
  'react': { createClass, { div }: DOM }: React
  'react-dom': ReactDom
  
  'react-router': ReactRouter

  'material-ui': MUI
  'material-ui/styles': MUIStyles
  
  'react-redux': ReactRedux

  './Incrementor.styl': css
}

{ Router, Route, Link, IndexRoute, browserHistory } = engino.createFactory ReactRouter
{ RaisedButton, TextField, FlatButton, AppBar} = engino.createFactory MUI
{ MuiThemeProvider, getMuiTheme, colors, darkBaseTheme } = engino.createFactory MUIStyles
{ connect } = engino.createFactory ReactRedux

mapStateToIncrementorProps = (number) ->
  { number }

module.exports = Incrementor = connect(mapStateToIncrementorProps, null) createClass do
  displayName: "Incrementor"

  componentDidMount: ->
    engino
    .request \incrementor/get
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