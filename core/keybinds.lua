local M = {}

local g_keys = require 'utils.keybinds.global'.global_keys
local g_buttons = require 'utils.keybinds.global'.global_buttons

return {
  root.keys(g_keys),
  root.buttons(g_buttons)
}
