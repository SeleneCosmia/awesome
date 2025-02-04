local gears = require 'gears'
local gfs   = require 'gears.filesystem'

local xrs   = require 'beautiful.xresources'
local dpi   = xrs.apply_dpi

local color = require 'themes.sunset.palette'

local theme = {}

theme.bg_normal   = color.coco
theme.bg_focus    = color.light.green
theme.bg_urgent   = color.red
theme.bg_minimize = color.dark.grey

return theme
