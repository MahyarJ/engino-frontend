require! {
  'react': { PropTypes, Component, createClass, createElement, { div }: DOM }: React
  'react-router': ReactRouter
  './Drawer.styl': css
  'material-ui': MUI
  'material-ui/List': { MakeSelectable, List }
  'material-ui/styles': { colors }: MUIStyles
}

{ Link, browserHistory } = engino.createFactory ReactRouter
{ RaisedButton, FlatButton, TextField, Drawer, MenuItem, ListItem, Divider, Subheader, Tabs, Tab, AppBar, Avatar } = engino.createFactory MUI

wrapState = (ComposedComponent) ->
  createClass do
    componentWillMount: ->
      @setState selectedIndex: @props.defaultValue

    handleRequestChange: (event, index) ->
      @setState selectedIndex: index

    render: ->
      createElement ComposedComponent,
        value: @state.selectedIndex
        onChange: (event, index) ~> @handleRequestChange event, index
        children: @props.children

SelectableList = MakeSelectable List
SelectableList = wrapState SelectableList
SelectableList = engino.createFactory SelectableList

module.exports = createClass do
  displayName: \Drawer
  # getInitialState: ->
  #   drawerOpen: yes

  handleToggleDrawer: ->
    @setState { drawerOpen: !@state.drawerOpen }

  render: ->
    Drawer { open: true, className: css.drawer },
      SelectableList { defaultValue: 1 },
        ListItem do
          className: css.avatar
          disabled: true
          leftAvatar: Avatar do
            backgroundColor: colors.cyan900
            color: colors.white500
            size: 60
            children: 'A'
        ListItem do
          disabled: true
          children: 'Your Name'
          className: css.username
        FlatButton className: css.editProfile, label: 'Edit Profile'
        Subheader children: 'Main Items'
        @props.items?.map (item, index) ->
          Link { style: {textDecoration: \none}, activeStyle: {}, key: item.key, to: item.link, onClick: -> console.log 'link clicked' },
            ListItem do
              value: item.key
              primaryText: item.text
              onClick: -> 'item clicked'