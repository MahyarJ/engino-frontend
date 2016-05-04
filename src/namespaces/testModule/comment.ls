# This is an example of React object creating
# ----------------------------------------------------------
# If this file was NOT here,
# the react functionality was as below:
#
# App = React.createClass do
#   displayName: \App
#   render: ->
#     React.createElement \div,
#       className: "clickable"
#       children: "Click Me"
#       onClick: (event) ->
#         console.log \Clicked, event
# ReactDom.render React.createElement(App, {}), document.getElementById('pg')
require! {
  'react': { createClass, createFactory }: React
  'react-dom': ReactDom
  '../../lib/react': { el, div, h1, h2, input }
  'redux': { createStore }: Redux
  './comment.styl': css
}

# Look here: https://facebook.github.io/react/docs/tutorial.html
data =
  * id: 1
    author: "Pete Hunt"
    text: "This is one comment."
  * id: 2
    author: "Jordan Walke"
    text: "This is another comment."
  * id: 3
    author: "Mahyar Jamalabadi"
    text: "This is my comment also."

CommentBox = createClass do
  getInitialState: ->
    console.log \initiation:, @state
    {}

  componentWillMount: ->
    console.log @props.data

  render: ->
    div do
      className: \commentBox
      children:
        h1 do
          children: 'Comments:'
        el CommentList,
          data: @props.data
        el CommentForm

CommentList = createClass do
  render: ->
    div do
      className: \commentList
      data: @props.data
      children:
        # React.createElement Comment,
        #   author: "Pete Hunt"
        #   children: "This is one comment."
        # React.createElement Comment,
        #   author: "Jordan Walke"
        #   children: "This is another comment."

        commentNodes = @props.data.map (comment) ->
          el Comment,
            author: comment.author
            key: comment.id
            children: comment.text

CommentForm = createClass do
  getInitialState: ->
    return do
      author: ''
      text: ''

  handleAuthorChange: (e) ->
    @setState do
      author: e.target.value

  handleTextChange: (e) ->
    @setState do
      text: e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    author = @state.author.trim()
    text = @state.text.trim()
    if !text or !author
      return
    else
      # Send request to the server
      console.log @state, 'The comment has been applied.'
      @setState do
        author: ''
        text: ''

  render: ->
    el \form,
      className: \commentForm
      onSubmit: @handleSubmit
      children:
        h1 do
          children: 'Leave Your Comment '

        input do
          className: css.fullWidth
          type: \text
          placeholder: "Your Name"
          value: @state.author
          onChange: @handleAuthorChange

        input do
          className: css.fullWidth
          type: \text
          placeholder: "Say somthing..."
          value: @state.text
          onChange: @handleTextChange

        input do
          className: css.fullWidth
          type: \submit
          value: "Post"

Comment = createClass do
  render: ->
    div do
      className: \comment
      children:
        h2 do
          className: \author
          children: @props.author
        @props.children

    # React.createElement \div,
    #   className: \comment
    #   children:
    #     React.createElement \h2,
    #       children: @props.author
    #     @props.children


ReactDom.render do
  el CommentBox, {data}
  document.getElementById \pg
