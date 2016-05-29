{ getMuiTheme, colors } = require 'material-ui/styles'

module.exports = muiTheme = getMuiTheme do
  isRtl: no
  fontFamily: "Iransans, Yekan, Roboto"
  palette:
    textColor: colors.cyan900

if muiTheme.isRtl
  document.body.style.direction = \rtl