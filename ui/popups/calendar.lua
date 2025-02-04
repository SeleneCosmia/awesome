local awful = require 'awful'
local gears = require 'gears'
local wibox = require 'wibox'

local bling  = require 'bling'
local rubato = require 'rubato'

local wibar_clock = require 'ui.widgets'.date_time()
local Popup = {}

Popup.calendar = awful.tooltip {}
