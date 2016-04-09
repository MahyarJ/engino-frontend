require! {
  'react': React
  'react-dom': ReactDom
}

module.exports = makeEl =
  el: (reactElement, params) ->
    React.createElement reactElement,
      params

  div: (params) -> makeEl.el \div, params
  h1:  (params) -> makeEl.el \h1, params
  h2:  (params) -> makeEl.el \h2, params