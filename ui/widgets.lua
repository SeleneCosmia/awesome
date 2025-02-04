local awful     = require 'awful'
local wibox     = require 'wibox'
local gears     = require 'gears'

--[[
local beautiful = require 'beautiful'
local xr        = beautiful.xresources
local dpi       = xr.get_dpi(0)
bg     = '#912749',
fg     = '#b97884',
]]

local W = {}

local text_clock = wibox.widget {
  format = ' %a %b %d, %I:%M %p ',
  font   = 'Cartograph CF, Thin',
  widget = wibox.widget.textclock
}

local function bg_box(cr, width, height)
  gears.shape.squircle(cr, width, height, 5, 0.12)
end

W.date_time = {
  text_clock,
  bg     = '#8c7f0b',
  fg     = '#292225',
  align = 'center',
  shape  = bg_box,
  clip   = true,
  widget = wibox.container.background,
}

return W
