local awful = require('awful')

local autostart = {
  '/usr/lib/polkit-kde-authentication-agent-1'
}

local function restarted()
  awesome.register_xproperty('restarted', 'boolean')
  local detected = awesome.get_xproperty('restarted') ~= nil
  awesome.set_xproperty('restarted', true)
  return detected
end

if not restarted() then
  for _, command in ipairs(autostart) do
    awful.spawn.easy_async({ 'pkill', '--full', '--uuid', os.getenv('USER'), '^' .. command }, function()
      awful.spawn.easy_async_with_shell(command, function() end)
    end)
  end
end
