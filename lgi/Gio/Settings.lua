---@meta Gio.Settings

---@class Gio.Settings._static : GObject.Object._static
---@operator call(Gio.Settings): table|nil
---@field list_schemas fun(): string[]

---@class Gio.Settings : Gio.Settings._static, GObject.Object
---@field get_string fun(self: Gio.Settings, key: string): string
---@field set_string fun(self: Gio.Settings, key: string, value: string)
---@field get_strv fun(self: Gio.Settings, key: string): string[]
---@field set_strv fun(self: Gio.Settings, key: string, value: string[])
