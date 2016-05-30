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

module.exports = createClass do
  displayName: \Drawer

  handleToggleDrawer: ->
    @setState { drawerOpen: !@state.drawerOpen }

  render: ->
    Drawer { open: true, className: css.drawer },
      createElement SelectableList,
        defaultValue: 1
        children:
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
          FlatButton { className: css.editProfile, label: 'Edit Profile' }
          Subheader { children: 'Main Items' }
          ListItem { value: 1, primaryText: 'Item1' }
          ListItem { value: 2, primaryText: 'Item2' }
          ListItem { value: 3, primaryText: 'Item3' }
          ListItem { value: 4, primaryText: 'Item4' }
          Divider { }
          Subheader { children: 'Second Items' }
          ListItem { value: 5, primaryText: 'Item1' }
          ListItem { value: 6, primaryText: 'Item2' }
          ListItem { value: 7, primaryText: 'Item3' }