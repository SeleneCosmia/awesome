-- awesome_mode: api-level=4:screen=on
package.loaded['awful.hotkeys_popup.keys.tmux'] = {}
require 'awful.hotkeys_popup.keys'

pcall(require, 'luarocks.loader')

require 'awful.permissions'
-- stylua: ignore start
local lgi         = require 'lgi'
local cairo       = lgi.cairo
local cr          = cairo.Context()

local gears       = require 'gears'
local gfs         = require 'gears.filesystem'
local awful       = require 'awful'
-- stylua: ignore end
local mods = require 'utils.globals'.modules
local modules_dir = mods.get_modules_dir()

package.path = package.path .. ';' .. modules_dir .. '?/init.lua;' .. modules_dir .. '?.lua'
package.cpath = package.cpath .. ';' .. modules_dir .. '?.so'
-- stylua: ignore start
local wibox       = require 'wibox'
local beautiful   = require 'beautiful'
local ruled       = require 'ruled'
local naughty     = require 'naughty'
local lain        = require 'lain'
local menubar     = require 'menubar'
-- local freedesktop = require 'freedesktop'

-- stylua: ignore end

terminal = 'wezterm'
editor = os.getenv('EDITOR') or 'nvim'

tag.connect_signal('request::default_layouts', function()
  awful.layout.append_default_layouts({
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.corner.sw,
    awful.layout.suit.tile.top,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.fair,
    awful.layout.suit.corner.ne,
    awful.layout.suit.corner.se,
    awful.layout.suit.floating,
    lain.layout.centerwork,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.fair.horizontal,
  })
end)

beautiful.init(gfs.get_themes_dir() .. 'default/theme.lua')

local myawesomemenu = {
  {
    'Hotkeys',
    function()
      require 'awful.hotkeys_popup.widget'.show_help(nil, awful.screen.focused())
    end,
  },
  { 'Manual', string.format('%s -e batman awesome', terminal) },
  { 'Edit config', string.format('%s -e %s %s', terminal, editor, awesome.conffile) },
  { 'Restart', awesome.restart },
  {
    'Quit',
    function()
      awesome.quit()
    end,
  },
}

mymainmenu = awful.menu({
  items = {
    { 'awesome', myawesomemenu, beautiful.awesome_icon },
    { 'open terminal', terminal },
  },
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

menubar.utils.terminal = terminal

require 'ui.wallpaper'
--- Wibar
local clock_widget = require 'ui.widgets'.date_time

screen.connect_signal('request::desktop_decoration', function(s)
  awful.tag({ ' 1 ', ' 2 ', ' 3 ', ' 4 ', ' 5 ' }, s, awful.layout.layouts[1])

  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox {
    screen = s,
    buttons = {
      awful.button({}, 1, function()
        awful.layout.inc(1)
      end),
      awful.button({}, 3, function()
        awful.layout.inc(-1)
      end),
      awful.button({}, 4, function()
        awful.layout.inc(-1)
      end),
      awful.button({}, 5, function()
        awful.layout.inc(1)
      end),
    },
  }

  s.mytaglist = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({}, 1, function(t)
        t:view_only()
      end),
      awful.button({ 'Mod4' }, 1, function(t)
        if client.focus then
          client.focus:move_to_tag(t)
        end
      end),
      awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({ 'Mod4' }, 3, function(t)
        if client.focus then
          client.focus:toggle_tag(t)
        end
      end),
      awful.button({}, 4, function(t)
        awful.tag.viewprev(t.screen)
      end),
      awful.button({}, 5, function(t)
        awful.tag.viewnext(t.screen)
      end),
    },
  }

  s.mywibox = awful.wibar {
    position = 'top',
    screen = s,
    bg = '#1e1c32',
    widget = {
      layout = wibox.layout.align.horizontal,
      -- expand = 'outside',
      {
        layout = wibox.layout.fixed.horizontal,
        mylauncher,
        s.mytaglist,
        s.mypromptbox,
      },
      clock_widget,
      {
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),
        s.mylayoutbox,
      },
    },
  }
end)

require 'core.keybinds'
require 'core.rules'

-- {{{ Titlebars
-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal('request::titlebars', function(c)
  -- buttons for the titlebar
  local buttons = {
    awful.button({}, 1, function()
      c:activate { context = 'titlebar', action = 'mouse_move' }
    end),
    awful.button({}, 3, function()
      c:activate { context = 'titlebar', action = 'mouse_resize' }
    end),
  }

  awful.titlebar(c).widget = {
    { -- Left
      awful.titlebar.widget.iconwidget(c),
      buttons = buttons,
      layout = wibox.layout.fixed.horizontal,
    },
    { -- Center
      { -- Title
        halign = 'center',
        widget = awful.titlebar.widget.titlewidget(c),
      },
      buttons = buttons,
      layout = wibox.layout.flex.horizontal,
    },
    { -- Right
      awful.titlebar.widget.floatingbutton(c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.stickybutton(c),
      awful.titlebar.widget.ontopbutton(c),
      awful.titlebar.widget.closebutton(c),
      layout = wibox.layout.fixed.horizontal(),
    },
    layout = wibox.layout.align.horizontal,
  }
end)
-- }}}

-- {{{ Notifications

ruled.notification.connect_signal('request::rules', function()
  ruled.notification.append_rule {
    rule = {},
    properties = {
      screen = awful.screen.preferred,
      implicit_timeout = 6,
    },
  }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal('mouse::enter', function(c)
  c:emit_signal('request::activate', 'mouse_enter', { raise = false })
end)

require 'utils.signals'

collectgarbage('incremental', 110, 1000, 0)
