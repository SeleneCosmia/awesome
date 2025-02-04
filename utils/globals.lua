local awful   = require 'awful'
local gears   = require 'gears'
local gfs     = require 'gears.filesystem'

local config_dir = gfs.get_configuration_dir

package.path = config_dir() .. 'modules/?/?.lua;' .. package.path .. ';'
package.path = config_dir() .. 'modules/?/init.lua;' .. package.path
package.cpath = config_dir() .. 'modules/?.so;' .. package.cpath
