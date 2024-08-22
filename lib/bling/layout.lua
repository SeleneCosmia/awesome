---@meta bling.layout

---@alias PaddingOpts '"default"' | number

---@class theme
---@field mstab_bar_disable boolean enable/disable the mstab layout tabbar
---@field mstab_bar_ontop boolean whether or not to draw the bar ontop of clients
--- determines whether tabbed stack windows should be smaller
--- than the currently focused stack window
--- > set to `true` if using transparent terminals
--- > or set to `false` if you use solid terminals with shadows
---@field mstab_dont_resize_slaves boolean
--- Either the number of pixels or `"default"`
---  Default adjusts based on the `useless gaps` setting
---@field mstab_bar_padding PaddingOpts
local theme = {}

