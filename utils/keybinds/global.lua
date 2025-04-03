local gears = require 'gears'
local awful = require 'awful'
local menubar = require 'menubar'
local hotkeys_popup = require 'awful.hotkeys_popup'.widget

local mod    = 'Mod4'
local alt    = 'Mod1'
local Ctrl   = 'Control'

local M = {}

-- ────( Mousebindings )──────────────────────────────────────────────
M.global_buttons = gears.table.join(
  awful.button({}, 3, function()
    mymainmenu:toggle()
  end),
  awful.button({}, 4, awful.tag.viewprev),
  awful.button({}, 5, awful.tag.viewnext)
)

-- ────( Keybindings )────────────────────────────────────────────────
M.global_keys = gears.table.join(
  awful.key({ mod }, 's', function()
    hotkeys_popup.show_help(nil, awful.screen.focused())
  end, {
    description = 'Show hotkeys help',
    group = 'awesome',
  }),

  awful.key ({ mod }, 'a', function() mymainmenu:show() end,
    { description = 'Main menu popup', group = 'awesome' }
  ),

  awful.key ({ mod, 'Shift' }, 'r', awesome.restart,
    { description = 'Reload awesome', group = 'awesome' }
  ),

  awful.key({ mod, 'Shift' }, 'q', awesome.quit,
    { description = 'Quit awesome', group = 'awesome' }
  ),

  awful.key({ mod }, 'x',
    function()
      awful.prompt.run {
        prompt = 'Run Lua code: ',
        textbox = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. '/history_eval',
      }
    end,
    { description = 'Eval & execute lua code', group = 'awesome' }
  ),

-- ╒═════════════════════════════════════════════════════════╕
-- │                                             Volume Keys │
-- ╘═════════════════════════════════════════════════════════╛
  awful.key({}, 'XF86AudioRaiseVolume', function()
      awful.spawn('wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+')
    end, {
      description = 'Raise volume',
      group = 'hotkeys'
    }
  ),

  awful.key({}, 'XF86AudioLowerVolume', function()
      awful.spawn('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-')
    end, {
      description = 'Decrease volume',
      group = 'hotkeys'
    }
  ),

  awful.key({}, 'XF86AudioMute', function()
      awful.spawn('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle')
    end, {
      description = 'Mute system audio',
      group = 'hotkeys'
    }
  ),

-- ╒═════════════════════════════════════════════════════════╕
-- │                                      App Launching Keys │
-- ╘═════════════════════════════════════════════════════════╛
  awful.key({ mod }, 'Return',
    function()
      awful.spawn(terminal)
    end,
    { description = 'Spawn Wezterm', group = 'launcher' }
  ),

  awful.key({ mod }, 'f',
    function()
      awful.spawn('firefox-nightly')
    end,
    { description = 'Launch Firefox-Nightly', group = 'launcher' }
  ),

  awful.key({ mod }, 'w',
    function()
      awful.spawn('waterfox')
    end,
    { description = 'Launch Waterfox', group = 'launcher' }
  ),

  awful.key({ mod }, 'r',
    function()
      awful.screen.focused().mypromptbox:run()
    end,
    { description = 'run prompt', group = 'launcher' }
  ),

  awful.key({ mod }, 'p',
    function()
      menubar.show()
    end,
    { description = 'show the menubar', group = 'launcher' }
  ),


  awful.key({ mod }, 'j',
    function()
      awful.client.focus.byidx(1)
    end,
    { description = 'focus next by index', group = 'client' }
  ),

  awful.key({ mod }, 'k',
    function()
      awful.client.focus.byidx(-1)
    end,
    { description = 'focus previous by index', group = 'client' }
  ),

  awful.key({ mod }, 'Tab',
    function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    { description = 'go back', group = 'client' }
  ),

  awful.key({ mod, Ctrl }, 'j',
    function()
      awful.screen.focus_relative(1)
    end,
    { description = 'focus the next screen', group = 'screen' }
  ),

  awful.key({ mod, Ctrl }, 'k',
    function()
      awful.screen.focus_relative(-1)
    end,
    { description = 'focus the previous screen', group = 'screen' }
  ),

  awful.key({ mod, Ctrl }, 'n',
    function()
      local c = awful.client.restore()
      if c then
        c:activate { raise = true, context = 'key.unminimize' }
      end
    end,
    { description = 'restore minimized', group = 'client' }
  ),

  awful.key({ mod }, 'Left',
    function ()
      awful.tag.viewprev()
    end,
    { description = 'view previous', group = 'tag' }
  ),

  awful.key({ mod }, 'Right',
    function()
      awful.tag.viewnext()
    end,
    { description = 'view next', group = 'tag' }
  ),

  awful.key({ mod }, 'Escape',
    function()
      awful.tag.history.restore()
    end,
    { description = 'go back', group = 'tag' }
  ),

-- ╒═════════════════════════════════════════════════════════╕
-- │                                             Layout Keys │
-- ╘═════════════════════════════════════════════════════════╛
  awful.key({ mod, 'Shift' }, 'j',
    function()
      awful.client.swap.byidx(1)
    end,
    { description = 'go back', group = 'client' }
  ),

  awful.key({ mod, 'Shift' }, 'k',
    function()
      awful.client.swap.byidx(-1)
    end,
    { description = 'swap with previous client by index', group = 'client' }
  ),

  awful.key({ mod }, 'u',
    function()
      awful.client.urgent.jumpto()
    end,
    { description = 'jump to urgent client', group = 'client' }
  ),

  awful.key({ mod }, 'l',
    function()
      awful.tag.incmwfact(0.05)
    end,
    { description = 'increase master width factor', group = 'layout' }
  ),

  awful.key({ mod }, 'h',
    function()
      awful.tag.incmwfact(-0.05)
    end,
    { description = 'decrease master width factor', group = 'layout' }
  ),

  awful.key({ mod, 'Shift' }, 'h',
    function()
      awful.tag.incnmaster(1, nil, true)
    end,
    { description = 'increase the number of master clients', group = 'layout' }
  ),

  awful.key({ mod, 'Shift' }, 'l',
    function()
      awful.tag.incnmaster(-1, nil, true)
    end,
    { description = 'decrease the number of master clients', group = 'layout' }
  ),

  awful.key({ mod, Ctrl }, 'h',
    function()
      awful.tag.incncol(1, nil, true)
    end,
    { description = 'increase the number of columns', group = 'layout' }
  ),

  awful.key({ mod, Ctrl }, 'l',
    function()
      awful.tag.incncol(-1, nil, true)
    end,
    { description = 'decrease the number of columns', group = 'layout' }
  ),

  awful.key({ mod }, 'space',
    function()
      awful.layout.inc(1)
    end,
    { description = 'select next', group = 'layout' }
  ),

  awful.key({ mod, 'Shift' }, 'space',
    function()
      awful.layout.inc(-1)
    end,
    { description = 'select previous', group = 'layout' }
  ),

  awful.key {
    modifiers = { mod },
    keygroup = 'numrow',
    description = 'only view tag',
    group = 'tag',
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only()
      end
    end,
  },

  awful.key {
    modifiers = { mod, Ctrl },
    keygroup = 'numrow',
    description = 'toggle tag',
    group = 'tag',
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end,
  },

  awful.key {
    modifiers = { mod, 'Shift' },
    keygroup = 'numrow',
    description = 'move focused client to tag',
    group = 'tag',
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
  },

  awful.key {
    modifiers = { mod, Ctrl, 'Shift' },
    keygroup = 'numrow',
    description = 'toggle focused client on tag',
    group = 'tag',
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end,
  }
)

return M
