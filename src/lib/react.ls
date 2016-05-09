require! {
  'react': { createElement }: React
  'react-dom': ReactDom
  'react-router': { Router, Route, Link, IndexRoute, browserHistory, hashHistory }: ReactRouter
}

module.exports = makeEl =
  # el: (reactElement, ...params) ->
  #   createElement reactElement, ...params

  el: createElement

  div: (params) -> makeEl.el \div, params
  h1:  (params) -> makeEl.el \h1, params
  h2:  (params) -> makeEl.el \h2, params
  input:  (params) -> makeEl.el \input, params

  # rtr: (params, children) ->
  #   createElement Router, params,
  #     children

  # rt: (params, children) ->
  #   createElement Route, params,
  #     children
