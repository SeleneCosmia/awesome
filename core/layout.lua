local awful = require 'awful'
local bling = require 'bling'
local beautiful = require 'beautiful'

tag.connect_signal('request::default_layouts', function()
  local layout = awful.layout.suit
  awful.layout.append_default_layouts({
    layout.tile,
    layout.tile.left,
    bling.layout.mstab,
    bling.layout.deck,
    layout.spiral,
    layout.spiral.dwindle,
    layout.tile.bottom,
    layout.tile.top,
    layout.corner.sw,
    layout.corner.nw,
    layout.fair,
    layout.floating
  })
end)

awful.screen.connect_for_each_screen(function(s)
  awful.tag({ '1', '2', '3', '4', '5', '6' }, s, awful.layout.layouts[1])
  s.padding = beautiful.useless_gap
end)
