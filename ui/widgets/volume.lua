local awful = require 'awful'
local gears = require 'gears'
local wibox = require 'wibox'
local cairo = require 'lgi'.cairo
local cr    = cairo.Context()

-- local function get_volume()
--  local cmd = 'wpctl get-volume @DEFAULT_AUDIO_SINK@'
--  local vol_now = string.format('%s | rg -o "(\d\.\d+)" ', cmd)
-- end

local volume_slider = wibox.widget {
  widget = wibox.widget.slider,

}

local volume_display = wibox.widget {
  
}
