local naughty = require 'naughty'

naughty.connect_signal('request::display_error', function(msg, startup)
  naughty.notification {
    urgency = 'critical',
    title   = 'Ummmm, so an error happened' .. (startup and ' during startup...' or '...'),
    message = msg,
  }
end)

naughty.connect_signal('request::display', function(n)
  naughty.layout.box {
    notification = n,
    type = 'notification'
  }
end)
