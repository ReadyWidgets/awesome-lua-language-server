---@meta lgi

---@class lgi
---@field Gio Gio
---@field Gtk Gtk
---@field Gdk Gdk
---@field GLib GLib
---@field GObject GObject
---@field Playerctl Playerctl
---@field UPowerGlib UPowerGlib
---@field DBus DBus
local lgi = {}

---@generic T
---@param module `T`
---@param version string
---@return `T`
function lgi.require(module, version) end
