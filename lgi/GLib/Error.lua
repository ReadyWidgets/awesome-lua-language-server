---@meta

---@class GLib.Error._static : GObject.Object._static
---@field new fun(domain: GLib.Quark, code: integer, format: string, ...: string): GLib.Error
---@field new_literal fun(domain: GLib.Quark, code: integer, message: string): GLib.Error
---@field new_valist fun(domain: GLib.Quark, code: integer, format: string, args: string[]): GLib.Error

---@class GLib.Error : GLib.Error._static, GObject.Object
---@field domain GLib.Quark
---@field code integer
---@field message string
---@field copy fun(self: GLib.Error): GLib.Error
---@field free fun(self: GLib.Error)
---@field matches fun(self: GLib.Error, domain: GLib.Quark, code: integer): boolean
