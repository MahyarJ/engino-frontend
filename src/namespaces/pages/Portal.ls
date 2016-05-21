require! {
  'react': { createClass, createElement, { div }: DOM }: React
  'react-router': ReactRouter
  './Portal.styl': css
  'material-ui': MUI
  'material-ui/styles': { colors }: MUIStyles
}

{ Link, browserHistory } = engino.createFactory ReactRouter
{ RaisedButton, FlatButton, TextField, Drawer, MenuItem, List, ListItem, Divider, Subheader, Tabs, Tab, AppBar, Avatar } = engino.createFactory MUI

module.exports = Portal = createClass do
  getInitialState: ->
    email: ""

  render: ->
    div {className: css.pg},
      div {className: css.bg}
      # div { className: css.tabsContainer },
      # Tabs { },
      #   Tab { className: css.tab, label: 'Tab 1' },
      #     div {}, 'First Content'
      #   Tab { className: css.tab, label: 'Tab 2' },
      #     div {}, 'Second Content'
      #   Tab { className: css.tab, label: 'Tab 3' },
      #     div {}, 'Third Content'
      #   Tab { className: css.tab, label: 'Tab 4' },
      #     div {}, 'Forth Content'
      # AppBar { title: 'My Portal' }
      Drawer { open: true, className: css.drawer },
        List { },
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
          ListItem { primaryText: 'Item1' }
          ListItem { primaryText: 'Item2' }
          ListItem { primaryText: 'Item3' }
          ListItem { primaryText: 'Item4' }
          Divider { }
          Subheader { children: 'Second Items' }
          ListItem { primaryText: 'Item1' }
          ListItem { primaryText: 'Item2' }
          ListItem { primaryText: 'Item3' }
        # MenuItem { children: \Item1 }
        # MenuItem { children: \Item2 }

