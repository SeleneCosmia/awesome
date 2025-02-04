local awful = require 'awful'

client.connect_signal('manage', function(c)
  if not awesome.startup then
    awful.client.setslave(c)
  end
end)

client.connect_signal('request::default_mousebindings', function()
  local clientbuttons = require 'utils.keys'.client_buttons
  awful.mouse.append_client_mousebindings(clientbuttons)
end)

client.connect_signal('request::default_keybindings', function()
  local clientkeys = require 'utils.keys'.client_keys
  awful.keyboard.append_client_keybindings(clientkeys)
end)
