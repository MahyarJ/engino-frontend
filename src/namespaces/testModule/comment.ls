# This is an example of React object creating

# ----------------------------------------------------------

# App = React.createClass do
#   displayName: \App
#   render: ->
#     React.createElement \div,
#       className: "clickable"
#       children: "Click Me"
#       onClick: (event) ->
#         console.log \Clicked, event

# ReactDom.render React.createElement(App, {}), document.getElementById('pg')

data =
  * id: 1
    author: "Pete Hunt"
    text: "This is one comment."
  * id: 2
    author: "Jordan Walke"
    text: "This is another comment."
  * id: 3
    author: "Mahyar Jamalabadi"
    text: "This is me :)"


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
  render: ->
    div do
      className: \commentForm
      children: "Hello this is a new CommentForm"

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
  document.getElementById('pg')
