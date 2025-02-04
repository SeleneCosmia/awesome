---@meta Gio.Cancellable

---@class Gio.Cancellable
local Cancellable = {}

---@return Gio.Cancellable
function Cancellable.new() end

---@param self Gio.Cancellable
function Cancellable:cancel() end

---@param self Gio.Cancellable
---@param callback fun()
---@param data? unknown
---@param data_destroy_func? fun()
---@return unknown?
function Cancellable:connect(callback, data, data_destroy_func) end

---@param self Gio.Cancellable
---@param handler_id integer|0
---@return unknown?
function Cancellable:disconnect(handler_id) end

---@param self Gio.Cancellable
---@return unknown?
function Cancellable:get_fd() end

---@param self lgi.Gio.Cancellable
---@return any?
function Cancellable:is_cancelled() end

---@param self lgi.Gio.Cancellable
---@param pollfd unknown
---@return unknown
function Cancellable:make_pollfd(pollfd) end

---@param self lgi.Gio.Cancellable
---@return unknown
function Cancellable:pop_current() end

---@param self lgi.Gio.Cancellable
---@return unknown
function Cancellable:push_current() end

---@param self lgi.Gio.Cancellable
---@return unknown
function Cancellable:release_fd() end

---@param self lgi.Gio.Cancellable
---@return unknown
function Cancellable:reset() end

---@param self lgi.Gio.Cancellable
---@return unknown
function Cancellable:set_error_if_cancelled() end

---@param self lgi.Gio.Cancellable
---@return unknown
function Cancellable:source_new() end

return Cancellable
