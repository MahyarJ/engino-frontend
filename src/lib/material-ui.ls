require! {
  'react': { createClass, createFactory }: React
  'react-dom': ReactDom
  './react': { el, div, h1, h2 }
  'material-ui': {
    RaisedButton
    TextField
    FlatButton
  }
}

RaisedButton = createFactory RaisedButton
TextField = createFactory TextField
FlatButton = createFactory FlatButton

module.exports =
  RaisedButton: RaisedButton
  TextField: TextField
  FlatButton: FlatButton