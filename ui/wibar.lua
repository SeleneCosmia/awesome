local lgi   = require 'lgi'
local cairo = lgi.cairo
local cr    = cairo.Context()

local awful = require 'awful'
local gears = require 'gears'
local wibox = require 'wibox'

local time_widget = require 'ui.widgets'.date_time

local wb = awful.wibar { position = 'top' }

wb:setup {
  layout = wibox.layout.align.horizontal,
  expand = 'outside',
  align  = 'left'
  {
  }
}
