local gears = require 'gears'
local awful = require 'awful'
local menubar = require 'menubar'
local hotkeys_popup = require 'awful.hotkeys_popup'

local modkey = 'Mod4'

local M = {}

M.globalkeys = gears.table.join({

  awful.key({ modkey }, 's', function()
    hotkeys_popup.show_help()
  end, {
    description = 'Show hotkeys help',
    group = 'awesome',
  }),
  -- launch programs
  awful.key({ modkey }, 'Return', function()
    awful.spawn(terminal)
  end, {
    description = 'Spawn Wezterm',
    group = 'launcher'
  }),

  awful.key({ modkey }, 'f', function()
    awful.spawn('firefox-nightly')
  end, {
    description = 'Launch Firefox',
    group = 'launcher',
  }),

  awful.key({ modkey }, 'w', function()
    awful.spawn('waterfox')
  end, {
    description = 'Launch Waterfox',
    group = 'launcher'
  }),

  awful.key({ modkey }, 'r', function()
    awful.screen.focused().mypromptbox:run()
  end, {
    description = 'run prompt',
    group = 'launcher'
  }),

})

return M
