local M = {}

---@param theme table
---@return table
M.load_themes = function(theme)
  theme = {}
  theme.plain = 'default'
  theme.lost  = 'lost-century'

  return theme
end

return M
