local awful = require 'awful'
local beautiful = require 'beautiful'
local hotkeys_popup = require 'awful.hotkeys_popup'
local menubar = require 'menubar'
local gfs = require 'gears'.filesystem
local wibox = require 'wibox'

local config_dir = gfs.get_configuration_dir()
local icon = {
  terminal = config_dir .. 'ui/assets/icons/terminal.svg'
}

local X = {}

local term_icon = wibox.widget.imagebox {
  image = icon.terminal,
  resize = true,
}

local quickmenu = {
  term     = { 'wezterm', 'kitty', 'rio', 'contour' },
  browser  = 'firefox-nightly',
  editor   = os.getenv('EDITOR') or 'nvim',
}
X.quickmenu = quickmenu

local submenu = {
  main = {
    { 'display hotkeys', function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { 'open manpage', quickmenu.term[1] .. ' start man awesome' },
    { 'edit config', quickmenu.editor .. ' ' .. awesome.conffile },
--- ⏻ Power Menu ---------------------
    { 'restart', awesome.restart },
    { 'quit', function() awesome.quit() end },
  },
  terminals = {
    { 'wezterm', quickmenu.term[1] },
    { 'kitty'  , quickmenu.term[2] },
    { 'rio'    , quickmenu.term[3] },
    { 'contour', quickmenu.term[4] }
  }
}

local main_menu = awful.menu({
  items = {
    { 'awesome', submenu.main, beautiful.awesome_icon },
--    { 'terminals', submenu.terminals,on }
  }
})
X.main_menu = main_menu

return X
