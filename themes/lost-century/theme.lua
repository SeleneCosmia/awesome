--
--
--
--
--
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

local theme_name = 'lost-century'

-- `Beautiful` Theme Modules
local theme_assets = require 'beautiful.theme_assets'
local dpi   = require 'beautiful.xresources'.apply_dpi
-- `Gears` Utility Library
local gears, gcolor = require 'gears', require 'gears.color'
local recolor = gcolor.recolor_image
local gfs   = require 'gears.filesystem'
local themes_path = gfs.get_themes_dir()

local theme = {}
theme.hotkeys_font             = 'Twilio Sans Mono Retina 13'
theme.hotkeys_description_font = 'Twilio Sans Mono Regular 10'

theme.prompt_font           = 'Cartograph CF Light 11'
theme.font                  = 'Recursive Monospace Casual 13'

theme.bg_normal             = '#4b3d44'
theme.bg_focus              = '#b3a555'
theme.bg_urgent             = '#ae5d40'
theme.bg_minimize           = '#847875'
theme.bg_systray            = theme.bg_normal
theme.border_radius         = dpi(0)

theme.fg_normal             = '#d2c9a5'
theme.fg_focus              = '#77743b'
theme.fg_urgent             = '#d1b187'
theme.fg_minimize           = theme.fg_normal

theme.useless_gap           = dpi(9)
theme.border_width          = dpi(3)
theme.border_color_normal   = '#927441'
theme.border_color_active   = '#4b726e'
theme.border_color_marked   = '#79444a'

theme.menu_height           = dpi(20)
theme.menu_width            = dpi(140)
theme.menu_font             = 'Cartograph CF Thin 10'
theme.menu_bg_normal        = theme.bg_normal
theme.menu_bg_focus         = theme.bg_minimize
theme.menu_fg_normal        = theme.fg_urgent
theme.menu_fg_focus         = theme.fg_normal

theme.prompt_bg             = theme.bg_focus
theme.prompt_fg             = theme.bg_normal
theme.prompt_fg_cursor      = theme.fg_focus

theme.wibar_bg              = '#574852'
theme.wibar_fg              = '#8caba1'
theme.wibar_type            = 'dock'
theme.wibar_height          = dpi(30)
theme.wibar_opacity         = 1

theme.taglist_bg_empty      = theme.wibar_bg
theme.taglist_bg_focus      = theme.bg_focus
theme.taglist_bg_urgent     = theme.bg_urgent
theme.taglist_bg_occupied   = theme.bg_normal
theme.taglist_bg_volatile   = '#c77b58'
theme.tagligst_fg           = theme.fg_normal

theme.tasklist_bg_focus     = theme.bg_normal
theme.tasklist_fg_focus     = theme.wibar_fg
theme.tasklist_bg_urgent    = theme.bg_urgent
theme.tasklist_fg_urgent    = theme.fg_urgent
theme.tasklist_bg_minimize  = '#282024'
theme.tasklist_fg_minimize  = '#84797e'

theme.titlebar_bg_focus     = theme.border_color_active
theme.titlebar_fg_focus     = theme.wibar_fg
theme.titlebar_bg_normal    = theme.wibar_bg
theme.titlebar_fg_normal    = theme.fg_normal

theme.tooltip_bg            = theme.wibar_bg
theme.tooltip_fg            = theme.fg_normal
theme.tooltip_opacity       = 0.85
theme.tooltip_font          = 'Comfortaa Regular 9'

theme.hotkeys_bg            = '#574852DA'
theme.hotkeys_fg            = theme.fg_normal
theme.hotkeys_border_width  = dpi(4)
theme.hotkeys_border_color  = theme.border_color_active

-- ╭─────────────────────────────────────────────────────────╮
-- │ Icons                                                   │
-- ╰─────────────────────────────────────────────────────────╯

local config_dir, data_dir = gfs.get_configuration_dir(), gfs.get_xdg_data_home()
local icons = {
  root_dir   = data_dir .. 'icons',
  theme_name = 'Gruvbox-Plus-Dark',

  bling  = config_dir .. 'modules/bling/icons/layout/default/',
  lain   = config_dir .. 'modules/lain/icons/layout/default/',
  layout = config_dir .. 'themes/default/layouts/'
}
--theme.icon_theme            = icon_theme

theme.layout_cornernw       = recolor(icons.layout .. 'cornernw.png', theme.fg_normal)
theme.layout_cornerne       = recolor(icons.layout .. 'cornerne.png', theme.fg_normal)
theme.layout_cornersw       = recolor(icons.layout .. 'cornersw.png', theme.fg_normal)
theme.layout_cornerse       = recolor(icons.layout .. 'cornerse.png', theme.fg_normal)
theme.layout_fairh          = recolor(icons.layout .. 'fairh.png', theme.fg_normal)
theme.layout_fairv          = recolor(icons.layout .. 'fairv.png', theme.fg_normal)
theme.layout_floating       = recolor(icons.layout .. 'floating.png', theme.fg_normal)
theme.layout_magnifier      = recolor(icons.layout .. 'magnifier.png', theme.fg_normal)
theme.layout_max            = recolor(icons.layout .. 'max.png', theme.fg_normal)
theme.layout_fullscreen     = recolor(icons.layout .. 'fullscreen.png', theme.fg_normal)
theme.layout_spiral         = recolor(icons.layout .. 'spiral.png', theme.fg_normal)
theme.layout_dwindle        = recolor(icons.layout .. 'dwindle.png', theme.fg_normal)
theme.layout_tile           = recolor(icons.layout .. 'tile.png', theme.fg_normal)
theme.layout_tiletop        = recolor(icons.layout .. 'tiletop.png', theme.fg_normal)
theme.layout_tilebottom     = recolor(icons.layout .. 'tilebottom.png', theme.fg_normal)
theme.layout_tileleft       = recolor(icons.layout .. 'tileleft.png', theme.fg_normal)
-- bling layouts
theme.layout_mstab          = recolor(icons.bling .. 'mstab.png', theme.fg_normal)
theme.layout_deck           = recolor(icons.bling .. 'deck.png', theme.fg_normal)
theme.layout_centered       = recolor(icons.bling .. 'centered.png', theme.fg_normal)
theme.layout_equalarea      = recolor(icons.bling .. 'equalarea.png', theme.fg_normal)
theme.layout_horizontal     = recolor(icons.bling .. 'horizontal.png', theme.fg_normal)
theme.layout_vertical       = recolor(icons.bling .. 'vertical.png', theme.fg_normal)
-- lain layouts
theme.layout_termfair       = recolor(icons.lain .. 'termfair.png', theme.fg_normal)
theme.layout_centerfair     = recolor(icons.lain .. 'centerfair.png', theme.fg_normal)
theme.layout_cascade        = recolor(icons.lain .. 'cascade.png', theme.fg_normal)
theme.layout_cascadetile    = recolor(icons.lain .. 'cascadetile.png', theme.fg_normal)
theme.layout_centerwork     = recolor(icons.lain .. 'centerwork.png', theme.fg_normal)
theme.layout_centerworkh    = recolor(icons.lain .. 'centerworkh.png', theme.fg_normal)

theme.awesome_icon = theme_assets.awesome_icon(
  theme.menu_height, theme.bg_normal, theme.wibar_fg
)

theme.menu_submenu_icon = nil

return theme
