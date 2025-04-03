local awful = require 'awful'
local wibox = require 'wibox'
local gears = require 'gears'
local gfs = gears.filesystem

awful.screen.connect_for_each_screen(function(s)
  awful.wallpaper {
    screen = s,
    bg = '#281507',
    widget = {
      {
        {
          image = os.getenv('HOME') .. '/Pictures/Pinterest-Downloads/nanaosaki_manga_panel_cutout.png',
          resize = false,
          point = awful.placement.bottom_right,
          widget = wibox.widget.imagebox,
        },
        widget = wibox.layout.manual,
      },
      margins = 7,
      widget = wibox.container.margin,
    },
  }
end)
