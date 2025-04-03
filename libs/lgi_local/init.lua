---@meta lgi
---@diagnostic disable: duplicate-doc-field

---@alias Flags<T> T|T[]|integer
---@alias FlagsDefinition<T> {[T]: integer, [integer]: T|{[T]: integer?, [1]: integer?}}
---@alias Enum<T> T|integer
---@alias EnumDefinition<T> {[T]: integer, [integer]: T}

---@alias lgi.Error.domain table|string
---@alias lgi.Error.code string|integer

---@class Error : userdata
---@field code string
---@field domain string
---@field matches fun(self: Error, other: Error): boolean
---@field matches fun(self: Error, domain: lgi.Error.domain, code: lgi.Error.code): boolean
---@field message string

---@class ErrorStatic
---@field new fun(domain: lgi.Error.domain, code: lgi.Error.code, message: string): Error

---@class lgi
---@field Gdk Gdk # Low-level abstraction for the GTK windowing system
---@field Gio Gio
---@field GLib GLib # A general-purpose, portable utility library, provides many useful data types, macros, type conversions, string utilities, file utilities, a mainloop abstraction, and so on.
---@field GObject GObject # The base type system and object classes used by GTK.
---@field Gtk Gtk # Widget toolkit for graphical interfaces
---@field GdkPixbuf GdkPixbuf # Library for image loading and manipulation
---@field cairo cairo
---@field Pango Pango
---@field require fun(module: string, version: string): unknown
local lgi = require 'lgi' ---@type lgi
return lgi
