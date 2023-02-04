---@meta Gio.AsyncResult

---@class Gio.AsyncResult._static : GObject.Object._static
local AsyncResult_static = {}

---@class Gio.AsyncResult : Gio.AsyncResult._static, GObject.Object
local AsyncResult = {}
--- ## Instance method `AsyncResult.get_source_object`
---
---@param self Gio.AsyncResult
---@return GObject.Object|nil
function AsyncResult.get_source_object(self) end

--- ## Instance method `AsyncResult.get_user_data`
---
---@param self Gio.AsyncResult
---@return any|nil
function AsyncResult.get_user_data(self) end

--- ## Instance method `AsyncResult.is_tagged`
---
---@param self Gio.AsyncResult
---@param source_tag any
---@return boolean
function AsyncResult.is_tagged(self, source_tag) end

--- ## Instance method `AsyncResult.legacy_propagate_error`
---
---@param self Gio.AsyncResult
---@param error? GLib.Error
---@return boolean
function AsyncResult.legacy_propagate_error(self, error) end
