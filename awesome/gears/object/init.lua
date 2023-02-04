---@meta

--- The object oriented programming base class used by various Awesome widgets and components.
---
--- It provide basic observer pattern, signaling and dynamic properties.
---@class gears.object._static
---@operator call({enable_properties?: boolean, enable_auto_signals?: boolean, class?: table}): gears.object
---@field emit_signal fun(signal_name: string, ...) Emit a notification signal.
---@field disconnect_signal fun(signal_name: string, callback: fun(...)) Disconnect a signal from a source.
---@field modulename fun(level?: integer) Helper function to get the module name out of debug.getinfo.

---@class gears.object : gears.object._static
---@field connect_signal fun(self: gears.object, signal_name: string, callback: fun(...)) Connect to a signal.
---@field weak_connect_signal fun(self: gears.object, signal_name: string, callback: fun(...)) Connect to a signal weakly.
---@field disconnect_signal fun(self: gears.object, signal_name: string, callback: fun(...)) Disonnect from a signal.
---@field emit_signal fun(self: gears.object, signal_name: string, ...) Emit a signal.
