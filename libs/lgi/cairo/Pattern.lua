---@meta lgi.cairo.Pattern

---@alias cairo_dither
---| 'NONE'
---| 'DEFAULT'
---| 'FAST'
---| 'GOOD'
---| 'BEST'

---@class Pattern
local Pattern

---@param surface unknown
function Pattern.create_for_surface(surface) end

---@param pattern lgi.cairo.Pattern
function Pattern.get_type(pattern) end

function Pattern:set_dither(pattern, dither) end

---@param pattern lgi.cairo.Pattern
---@return cairo_dither
function Pattern:get_dither(pattern) end

---@class lgi.cairo.Pattern: Pattern
local M

return M
