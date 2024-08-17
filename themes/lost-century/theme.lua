local xresources = require 'beautiful'.xresources
local dpi = xresources.apply_dpi

local gfs = require 'gears.filesystem'
local themes_path = gfs.get_themes_dir()

local bling_path = require 'bling.helpers'.filesystem

local theme = {}

theme.font                  = 'DynaPuff 12'

theme.bg_normal             = '#4b3d44'
theme.bg_focus              = '#b3a555'
theme.bg_urgent             = '#ae5d40'
theme.bg_minimize           = '#847875'
theme.bg_systray            = theme.bg_normal

theme.fg_normal             = '#d2c9a5'
theme.fg_focus              = '#77743b'
theme.fg_urgent             = '#d1b187'
theme.fg_minimize           = theme.fg_normal

theme.useless_gap           = dpi(10)
theme.border_width          = dpi(2)
theme.border_color_normal   = '#927441'
theme.border_color_active   = '#4b726e'
theme.border_color_marked   = '#79444a'

theme.local_icons           = os.getenv('XDG_DATA_HOME') ..
                              '/icons/Gruvbox-Plus-Dark'

theme.icon_theme            = theme.local_icons

-- bling module theme variables:

theme.bling_icons               = os.getenv('XDG_CONFIG_HOME') ..
                                  '/awesome/modules/bling/icons/layout/default/'

theme.layout_mstab              = theme.bling_icons .. 'mstab.png'
theme.layout_deck               = theme.bling_icons .. ''

theme.flash_focus_start_opacity = 0.5
theme.flash_focus_step          = 0.03
