local gfs = require 'gears.filesystem'
local xrs = require 'beautiful.xresources'
local dpi = xrs.apply_dpi
local color = require 'themes.borkfest.palette'

local theme = {}

theme.bg_normal   = color.black
theme.bg_focus    = color.orange.main
theme.bg_urgent   = color.red
theme.bg_minimize = color.green
theme.bg_systray  = theme.bg_normal

theme.fg_normal   = color.white
theme.fg_focus    = color.black
theme.fg_urgent   = color.white
theme.fg_minimize = color.yellow

theme.useless_gap   = dpi(6)
theme.border_width  = dpi(2)

theme.border_color_normal = color.orange.light
theme.border_color_active = theme.bg_focus
theme.border_color_marked = color.orange.dark

return theme
