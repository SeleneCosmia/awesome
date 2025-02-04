---@diagnostic disable: need-check-nil
local awful = require 'awful'
local gears = require 'gears'
local menubar = require 'menubar'
local hotkeys_popup = require 'awful.hotkeys_popup'

require 'awful.hotkeys_popup.keys'
local key = awful.key
local modkey = 'Mod4'

-- {{{ Mouse bindings
awful.mouse.append_global_mousebindings({
  awful.button({}, 3, function()
    mymainmenu:toggle()
  end),
  awful.button({}, 4, awful.tag.viewprev),
  awful.button({}, 5, awful.tag.viewnext),
})
-- }}}

-- {{{ Key bindings

-- General Awesome key
awful.keyboard.append_global_keybindings({
  key({ modkey }, 's', hotkeys_popup.show_help, {
    description = 'Show the hotkeys popup widget',
    group = 'awesome',
  }),

  key({ modkey }, 'a', function()
    mymainmenu:show()
  end, {
    description = 'Main menu popup',
    group = 'awesome',
  }),

  key({ modkey, 'Shift' }, 'r', awesome.restart, {
    description = 'Reload awesome',
    group = 'awesome',
  }),

  key({ modkey, 'Shift' }, 'q', awesome.quit, {
    description = 'Quit awesome',
    group = 'awesome',
  }),

  key({ modkey }, 'x', function()
    awful.prompt.run {
      prompt = 'Run Lua code: ',
      textbox = awful.screen.focused().mypromptbox.widget,
      exe_callback = awful.util.eval,
      history_path = awful.util.get_cache_dir() .. '/history_eval',
    }
  end, {
    description = 'Eval & execute lua code',
    group = 'awesome',
  }),
})

awful.keyboard.append_global_keybindings({
  key({ modkey }, 'Return', function()
    awful.spawn(terminal)
  end, {
    description = 'Spawn Wezterm',
    group = 'launcher',
  }),

  key({ modkey }, 'f', function()
    awful.spawn('firefox-nightly')
  end, {
    description = 'Launch Firefox-Nightly',
    group = 'launcher',
  }),

  key({ modkey }, 'w', function()
    awful.spawn('waterfox')
  end, {
    description = 'Launch Waterfox',
    group = 'launcher',
  }),

  key({ modkey }, 'r', function()
    awful.screen.focused().mypromptbox:run()
  end, {
    description = 'run prompt',
    group = 'launcher',
  }),

  key({ modkey }, 'p', function()
    menubar.show()
  end, {
    description = 'show the menubar',
    group = 'launcher',
  }),

  key({}, 'XF86AudioRaiseVolume', function()
    awful.spawn.with_shell('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+')
  end, {
    description = 'Increase global volume',
    group = 'audio',
  }),

  key({}, 'XF86AudioLowerVolume', function()
    awful.spawn.with_shell('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-')
  end, {
    description = 'Lower global volume',
    group = 'audio',
  }),

  key({}, 'XF86AudioMute', function()
    awful.spawn.with_shell('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle')
  end, {
    description = 'Mute audio',
    group = 'audio',
  }),

  key({ modkey }, 'j', function()
    awful.client.focus.byidx(1)
  end, {
    description = 'focus next by index',
    group = 'client',
  }),

  key({ modkey }, 'k', function()
    awful.client.focus.byidx(-1)
  end, {
    description = 'focus previous by index',
    group = 'client',
  }),

  key({ modkey }, 'Tab', function()
    awful.client.focus.history.previous()
    if client.focus then
      client.focus:raise()
    end
  end, {
    description = 'go back',
    group = 'client',
  }),

  key({ modkey, 'Control' }, 'j', function()
    awful.screen.focus_relative(1)
  end, {
    description = 'focus the next screen',
    group = 'screen',
  }),

  key({ modkey, 'Control' }, 'k', function()
    awful.screen.focus_relative(-1)
  end, {
    description = 'focus the previous screen',
    group = 'screen',
  }),

  key({ modkey, 'Control' }, 'n', function()
    local c = awful.client.restore()
    if c then
      c:activate { raise = true, context = 'key.unminimize' }
    end
  end, {
    description = 'restore minimized',
    group = 'client',
  }),
})

-- Tag related keybindings
awful.keyboard.append_global_keybindings({
  key({ modkey }, 'Left', awful.tag.viewprev, { description = 'view previous', group = 'tag' }),
  key({ modkey }, 'Right', awful.tag.viewnext, { description = 'view next', group = 'tag' }),
  key({ modkey }, 'Escape', awful.tag.history.restore, { description = 'go back', group = 'tag' }),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
  key({ modkey, 'Shift' }, 'j', function()
    awful.client.swap.byidx(1)
  end, {
    description = 'swap with next client by index',
    group = 'client',
  }),

  key({ modkey, 'Shift' }, 'k', function()
    awful.client.swap.byidx(-1)
  end, { description = 'swap with previous client by index', group = 'client' }),

  key({ modkey }, 'u', awful.client.urgent.jumpto, { description = 'jump to urgent client', group = 'client' }),

  key({ modkey }, 'l', function()
    awful.tag.incmwfact(0.05)
  end, { description = 'increase master width factor', group = 'layout' }),

  key({ modkey }, 'h', function()
    awful.tag.incmwfact(-0.05)
  end, { description = 'decrease master width factor', group = 'layout' }),

  key({ modkey, 'Shift' }, 'h', function()
    awful.tag.incnmaster(1, nil, true)
  end, { description = 'increase the number of master clients', group = 'layout' }),

  key({ modkey, 'Shift' }, 'l', function()
    awful.tag.incnmaster(-1, nil, true)
  end, { description = 'decrease the number of master clients', group = 'layout' }),

  key({ modkey, 'Control' }, 'h', function()
    awful.tag.incncol(1, nil, true)
  end, { description = 'increase the number of columns', group = 'layout' }),

  key({ modkey, 'Control' }, 'l', function()
    awful.tag.incncol(-1, nil, true)
  end, { description = 'decrease the number of columns', group = 'layout' }),

  key({ modkey }, 'space', function()
    awful.layout.inc(1)
  end, { description = 'select next', group = 'layout' }),

  key({ modkey, 'Shift' }, 'space', function()
    awful.layout.inc(-1)
  end, { description = 'select previous', group = 'layout' }),
})

awful.keyboard.append_global_keybindings({
  key {
    modifiers = { modkey },
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
  key {
    modifiers = { modkey, 'Control' },
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
  key {
    modifiers = { modkey, 'Shift' },
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
  key {
    modifiers = { modkey, 'Control', 'Shift' },
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
  },
})

client.connect_signal('request::default_mousebindings', function()
  awful.mouse.append_client_mousebindings({
    awful.button({}, 1, function(c)
      c:activate { context = 'mouse_click' }
    end),
    awful.button({ modkey }, 1, function(c)
      c:activate { context = 'mouse_click', action = 'mouse_move' }
    end),
    awful.button({ modkey }, 3, function(c)
      c:activate { context = 'mouse_click', action = 'mouse_resize' }
    end),
  })
end)

client.connect_signal('request::default_keybindings', function()
  awful.keyboard.append_client_keybindings({
    key({ modkey, 'Shift' }, 'f', function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end, { description = 'toggle fullscreen', group = 'client' }),

    key({ modkey, 'Shift' }, 'c', function(c)
      c:kill()
    end, { description = 'close', group = 'client' }),

    key(
      { modkey, 'Control' },
      'space',
      awful.client.floating.toggle,
      { description = 'toggle floating', group = 'client' }
    ),
    key({ modkey, 'Control' }, 'Return', function(c)
      c:swap(awful.client.getmaster())
    end, { description = 'move to master', group = 'client' }),
    key({ modkey }, 'o', function(c)
      c:move_to_screen()
    end, { description = 'move to screen', group = 'client' }),
    key({ modkey }, 't', function(c)
      c.ontop = not c.ontop
    end, { description = 'toggle keep on top', group = 'client' }),
    key({ modkey }, 'n', function(c)
      -- The client currently has the input focus, so it cannot be
      -- minimized, since minimized clients can't have the focus.
      c.minimized = true
    end, { description = 'minimize', group = 'client' }),
    key({ modkey }, 'm', function(c)
      c.maximized = not c.maximized
      c:raise()
    end, { description = '(un)maximize', group = 'client' }),
    key({ modkey, 'Control' }, 'm', function(c)
      c.maximized_vertical = not c.maximized_vertical
      c:raise()
    end, { description = '(un)maximize vertically', group = 'client' }),
    key({ modkey, 'Shift' }, 'm', function(c)
      c.maximized_horizontal = not c.maximized_horizontal
      c:raise()
    end, { description = '(un)maximize horizontally', group = 'client' }),
  })
end)
