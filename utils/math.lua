local utils = {}

---@param ... number
---@return number max
function utils.max(...)
  local max = select(1, ...)
  for i = 2, select('#', ...) do
    local x = select(i, ...)
    if max < x then
      max = x
    end
  end
  return max
end

---@param ... number
---@return number min
function utils.min(...)
  local min = select(1, ...)
  for i = 2, select('#', ...) do
    local x = select(i, ...)
    if min > x then
      min = x
    end
  end
  return min
end

--- This function takes a |float| value as param and rounds it to the nearest integer
--- Optionally uses a provided *digit* value for rounding to nearest nth digit.
---@param float number
---@param digit? integer
---@return integer
function utils.round(float, digit)
  if digit then
    return math.floor(float * 10 ^ digit + 0.5) / 10 ^ digit
  else
    return math.floor(float + 0.5)
  end
end

--- Clamp the provided _value_ (first param) between the provided __min__ & __max__ values.
---@param val number
---@param min number # the lowest [floor] value in clamp range
---@param max number # the highest [ceil] value in clamp range
---@return number val
function utils.clamp(val, min, max)
  if val < min then
    return min
  elseif val > max then
    return max
  end
  return val
end

return utils
