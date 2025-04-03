local awful = require 'awful'
local ruled = require 'ruled'
local new_rule = ruled.client.append_rule

if not pcall(require, 'awful.permissions') then
  pcall(require, 'awful.autofocus')
end

local screen_height = awful.screen.focused().geometry.height
local screen_width = awful.screen.focused().geometry.width

require 'utils.client'

ruled.client.connect_signal('request::rules', function()
  new_rule {
    id = 'global',
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
    },
  }

  new_rule {
    id = 'floating',
    rule_any = {
      instance = {
        'copyq',
        'pinentry',
      },
      class = {
        'Arandr',
        'Blueman-manager',
        'Gpick',
        'Kruler',
        'Sxiv',
        'Devtools',
        'Tor Browser',
        'Wpa_gui',
        'veromix',
        'xtightvncviewer',
      },
      name = {
        'Event Tester',
        'Oklch Color Picker',
      },
      role = {
        'ConfigManager',
        'pop-up',
      },
    },
    properties = {
      floating = true,
      ontop = true,
    },
    callback = function(c)
      awful.placement.centered(c)
    end,
  }

  new_rule {
    rule_every = {
      instance = { 'Blender' },
      class = { 'Blender' },
      name = { 'Preferences' },
    },
    properties = {
      floating = true,
      maximized = false,
      ontop = true,
    },
  }

  new_rule {
    rule_any = {
      class = { 'UltiMaker-Cura' },
      name = { 'Marketplace', 'Preferences' },
    },
    except_any = {
      name = { 'UltiMaker Cura' },
    },
    properties = {
      floating = true,
      placement = awful.placement.centered,
    },
  }

  new_rule {
    rule = { type = { 'splash' } },
    properties = {
      floating = true,
      titlebars_enabled = false,
    },
  }

  new_rule {
    rule_any = { class = { 'pavucontrol' } },
    properties = {
      floating = true,
      width = screen_width * 0.55,
      height = screen_height * 0.45,
      ontop = true,
      below = false,
      sticky = true,
    },
    callback = function(c)
      awful.placement.top(c)
    end,
  }

  -- new_rule {
  --   rule = { class = 'oklch-color-picker' },
  -- }

  new_rule {
    id = 'pip',
    rule_every = {
      name = { 'Picture-in-Picture' },
      role = { 'PictureInPicture' },
      class = { 'Picture-in-Picture', 'waterfox' },
    },
    properties = {
      sticky = true,
    },
  }

  new_rule {
    id = 'titlebars',
    rule_any = { type = { 'normal', 'dialog' } },
    properties = { titlebars_enabled = true },
  }
end)
