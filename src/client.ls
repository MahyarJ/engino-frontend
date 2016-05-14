window.engino = {}

requireAll = (requireContext) ->
  helpers = {}
  for filename in requireContext.keys!
    name = filename.replace(/^\.\//, '').replace(/\.ls$/, '')
    helpers[name] = requireContext filename
  helpers

lib = requireAll require.context './lib', false, /\.ls$/

require! {
  'react-tap-event-plugin': injectTapEventPlugin
  # './namespaces/testModule/incrementor'
  # './namespaces/testModule/comment'
  './namespaces/pages'
  './app.styl': css
}

injectTapEventPlugin()