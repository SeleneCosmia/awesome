---@meta lgi.Gtk

---@alias message_type
---| "'INFO'"
---| "''"

---@class lgi.Gtk
---@field IconTheme IconTheme
---@field InfoBar InfoBar
---@field DrawingArea DrawingArea
---@field Window Window
local Gtk = {}

---@class DrawingArea
---@field expand? boolean
Gtk.DrawingArea = {}

---@class InfoBar
---@field message_type message_type
Gtk.InfoBar = {}

---@class Window
---@field width_request? integer
---@field height_request? integer
---@field title string
---@field resizable? boolean
---@field application? any
Gtk.Window = {}

function Gtk.Window:on_destroy() end

function Gtk.Window:show_all() end

function Gtk:main() end

return Gtk
