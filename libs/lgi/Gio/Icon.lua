---@meta Gio.Icon

---@type lgi
local lgi = require 'lgi'

---@class Gio.Icon
---@field deserialize fun(value: unknown): unknown
---@field new_for_string fun(string: string): unknown
local Icon = lgi.Gio.Icon

---@param self Gio.Icon
---@param icon2? unknown
---@return unknown
function Icon:equal(icon2) end

---@param self Gio.Icon
---@return unknown
function Icon:hash() end

---@param self Gio.Icon
---@return unknown
function Icon:serialize() end

---@param self Gio.Icon
---@return unknown
function Icon:to_string() end

return lgi.Gio.Icon
