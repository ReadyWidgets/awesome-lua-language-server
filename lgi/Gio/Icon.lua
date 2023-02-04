---@meta Gio.Icon

---@class Gio.Icon._static : GObject.Object._static
---@field new_for_string fun(str: string, error?: GLib.Error)
---@field deserialize function
---@field hash function

---@class Gio.Icon : Gio.Icon._static, GObject.Object
---@field equal function
---@field hash function
---@field serialize function
---@field to_string function
