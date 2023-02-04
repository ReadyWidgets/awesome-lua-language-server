---@meta Gio.ThemedIcon

---@class Gio.ThemedIcon._static : Gio.Icon._static
---@operator call(string): Gio.ThemedIcon
---@field new fun(icon_name: string)
---@field new_from_names function
---@field new_with_default_fallbacks function

---@class Gio.ThemedIcon : Gio.ThemedIcon._static, Gio.Icon
---@field append_name function
---@field get_names function
---@field prepend_name function
---@field name string
---@field names string[]
---@field use-default-fallbacks boolean
