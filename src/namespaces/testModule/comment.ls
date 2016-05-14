require! {
  'react': { createClass, createElement, DOM }: React
  'react-dom': ReactDom
  'redux': { createStore }: Redux
  './comment.styl': css
}

{ div, h1, h2, input } = DOM

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
    data: null

  handleCommentSubmit: (comment) ->
    comments = @state.data or @props.data
    # Before sending to server, we make UI optimisticly update
    comment.id = Date.now()
    newComments = comments.concat [comment]
    console.log newComments
    @setState data: newComments
    # TODO: Submit to the server and refresh the list of comments
    console.log "`#{comment.text}` by #{comment.author}, stored in server and list has been refreshed"

  render: ->
    div do
      className: \commentBox
      children:
        h1 do
          children: 'Comments:'
        createElement CommentList,
          data: @state.data or @props.data
        createElement CommentForm,
          onCommentSubmit: @handleCommentSubmit

CommentList = createClass do
  render: ->
    div do
      className: \commentList
      data: @props.data
      children:
        commentNodes = @props.data.map (comment) ->
          createElement Comment,
            author: comment.author
            key: comment.id
            children: comment.text

CommentForm = createClass do
  getInitialState: ->
    return { author: '', text: ''}

  handleAuthorChange: (e) ->
    @setState { author: e.target.value }

  handleTextChange: (e) ->
    @setState { text: e.target.value }

  handleSubmit: (e) ->
    e.preventDefault()
    author = @state.author.trim()
    text = @state.text.trim()
    if !text or !author
      return
    else
      # Imagine request will send to the server here
      console.log @state, 'The comment has been applied.'
      @props.onCommentSubmit { author: author, text: text }
      @setState { author: '', text: '' }

  render: ->
    createElement \form,
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

# --------------------------------------
ReactDom.render do
  createElement CommentBox, {data}
  document.getElementById \pg
