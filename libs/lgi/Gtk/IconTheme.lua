---@meta lgi.Gtk.IconTheme

---@class lgi.Gtk.IconTheme : lgi.GObject.Object
local IconTheme = {}

---@return lgi.Gtk.IconTheme
function IconTheme.new() end

---@param icon_name any
---@param size any
---@param pixbuf any
function IconTheme.add_builtin_icon(icon_name, size, pixbuf) end
