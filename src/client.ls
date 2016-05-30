window.engino = {}

requireAll = (requireContext) ->
  helpers = {}
  for filename in requireContext.keys!
    name = filename.replace(/^\.\//, '').replace(/\.ls$/, '')
    helpers[name] = requireContext filename
  helpers

lib = requireAll require.context './lib', true, /\.ls$/

require! {
  './namespaces'
  './app.styl': css
}

