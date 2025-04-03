local awful  = require 'awful'
local wibox  = require 'wibox'
local gears  = require 'gears'
local gtimer = require 'gears.timer'

---@class config.Globals
local M = {}

local create_xprop = awesome.register_xproperty

---
local picom_running = awesome.composite_manager_running

-- @param setup boolean Are we *registering?* `true` or _setting_ `false` the given xprop.
-- @param xprop string The name of new xproperty
-- @param opts table
-- function M.client_xprops(setup, xprop, opts)
--   if not picom_running then
--     return
--   end
--
-- end

M.modules = {}

---@param directory? string
function M.modules.get_modules_dir(directory)
  directory = directory or 'modules/'

  if string.find(directory, '/$') == nil then
    directory = directory .. '/'
  else
    directory = directory
  end

  local modules_dir = gears.filesystem.get_configuration_dir() .. directory

  return modules_dir
end

return M
