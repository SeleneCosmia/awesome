---@meta lgi.cairo

---@class cairo
---@field Pattern lgi.cairo.Pattern
---@field Surface lgi.cairo.Surface
---@field Context lgi.cairo.Context
local cairo

---@return integer?
function cairo.version() end

---@return string?
function cairo.version_string() end

--- This function is a reimplementation of the *CAIRO_VERSION_ENCODE* macro
--- in the native c source code
--- ---
---@param major integer # Major version number
---@param minor integer # Minor version number
---@param micro integer # Micro version number
---
---## Example usage:
--- ```lua
---  if cairo.version >= cairo.version_encode(1, 12, 0) then
---    -- code to run if cairo version is >= 1.12.0
---  else
---    -- code for older versions of cairo
---  end
--- ```
---
--- [source docs on github](https://github.com/lgi-devs/lgi/blob/master/docs/cairo.md#version-checking)
function cairo.version_encode(major, minor, micro) end

---@alias cairo_status ""|""|""

---@generic T
---@return `T`? cairo_status
function cairo.status() end


---@class lgi.cairo: cairo
local M

return M
