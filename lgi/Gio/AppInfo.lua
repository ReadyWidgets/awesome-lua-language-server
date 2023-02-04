---@meta Gio.AppInfo

---@class Gio.AppInfo._static : GObject.Object._static
local AppInfo_static = {}
--- ## Static function `AppInfo.create_from_commandline()`
---
---@param commandline string
---@param application_name string
---@param flags Gio.AppInfoCreateFlags
---@param error GLib.Error
---@return Gio.DesktopAppInfo
function AppInfo_static.create_from_commandline(commandline, application_name, flags, error) end

--- ## Static function `AppInfo.get_all()`
---
---@return Gio.DesktopAppInfo[]
function AppInfo_static.get_all() end

--- ## Static function `AppInfo.get_all_for_type()`
---
---@param content_type string
---@return Gio.DesktopAppInfo[]
function AppInfo_static.get_all_for_type(content_type) end

--- ## Static function `AppInfo.get_default_for_type()`
---
---@param content_type string
---@param must_support_uris boolean
---@return Gio.DesktopAppInfo
function AppInfo_static.get_default_for_type(content_type, must_support_uris) end

--- ## Static function `AppInfo.get_default_for_type_async()`
---
---@param content_type string
---@param must_support_uris boolean
---@param cancellable? Gio.Cancellable
---@param callback? Gio.AsyncReadyCallback
---@param user_data? any
function AppInfo_static.get_default_for_type_async(content_type, must_support_uris, cancellable, callback, user_data) end

--- ## Static function `AppInfo.get_default_for_type_finish()`
---
---@param result Gio.AsyncResult
---@param error? GLib.Error
---@return Gio.DesktopAppInfo|nil
function AppInfo_static.get_default_for_type_finish(result, error) end

--- ## Static function `AppInfo.get_default_for_uri_scheme()`
---
---@param uri_scheme string
---@return Gio.DesktopAppInfo|nil
function AppInfo_static.get_default_for_uri_scheme(uri_scheme) end

--- ## Static function `AppInfo.get_default_for_uri_scheme_async()`
---
---@param uri_scheme string
---@param cancellable? Gio.Cancellable
---@param callback Gio.AsyncReadyCallback
---@param user_data? any
function AppInfo_static.get_default_for_uri_scheme_async(uri_scheme, cancellable, callback, user_data) end

--- ## Static function `AppInfo.get_default_for_uri_scheme_finish()`
---
---@param result Gio.AsyncResult
---@param error? GLib.Error
---@return Gio.DesktopAppInfo|nil
function AppInfo_static.get_default_for_uri_scheme_finish(result, error) end

--- ## Static function `AppInfo.get_fallback_for_type()`
---
---@param content_type string
---@return Gio.DesktopAppInfo[]|nil
function AppInfo_static.get_fallback_for_type(content_type) end

--- ## Static function `AppInfo.get_recommended_for_type()`
---
---@param content_type string
---@return Gio.DesktopAppInfo[]|nil
function AppInfo_static.get_recommended_for_type(content_type) end

--- ## Static function `AppInfo.launch_default_for_uri()`
---
---@param uri string
---@param context? Gio.AppLaunchContext
---@param error? GLib.Error
---@return boolean
function AppInfo_static.launch_default_for_uri(uri, context, error) end

--- ## Static function `AppInfo.launch_default_for_uri_async()`
---
---@param uri string
---@param cancellable? Gio.Cancellable
---@param callback Gio.AsyncReadyCallback
---@param user_data? any
function AppInfo_static.launch_default_for_uri_async(uri, cancellable, callback, user_data) end

--- ## Static function `AppInfo.launch_default_for_uri_finish()`
---
---@param result Gio.AsyncResult
---@param error? GLib.Error
---@return Gio.AppInfo|nil
function AppInfo_static.launch_default_for_uri_finish(result, error) end

--- ## Static function `AppInfo.reset_type_associations()`
---
---@param content_type string
function AppInfo_static.reset_type_associations(content_type) end

----------------------------------------------------------------------------

---@class Gio.AppInfo : Gio.AppInfo._static, GObject.Object
local AppInfo = {}
--- ## Instance method `AppInfo:add_supports_type()`
---
---@param self Gio.AppInfo
---@param content_type string
---@param error? GLib.Error
---@return boolean
function AppInfo.add_supports_type(self, content_type, error) end

--- ## Instance method `AppInfo:can_delete()`
---
---@param self Gio.AppInfo
---@return boolean
function AppInfo.can_delete(self) end

--- ## Instance method `AppInfo:can_remove_supports_type()`
---
---@param self Gio.AppInfo
---@return boolean
function AppInfo.can_remove_supports_type(self) end

--- ## Instance method `AppInfo:delete()`
---
---@param self Gio.AppInfo
---@return boolean
function AppInfo.delete(self) end

--- ## Instance method `AppInfo:dup()`
---
---@param self Gio.AppInfo
---@return Gio.AppInfo._static
function AppInfo.dup(self) end

--- ## Instance method `AppInfo:equal()`
---
---@param self Gio.AppInfo
---@param other Gio.AppInfo
---@return boolean
function AppInfo.equal(self, other) end

--- ## Instance method `AppInfo:get_commandline()`
---
---@param self Gio.AppInfo
---@return string|nil
function AppInfo.get_commandline(self) end

--- ## Instance method `AppInfo:get_description()`
---
---@param self Gio.AppInfo
---@return string|nil
function AppInfo.get_description(self) end

--- ## Instance method `AppInfo:get_display_name()`
---
---@param self Gio.AppInfo
---@return string
function AppInfo.get_display_name(self) end

--- ## Instance method `AppInfo:get_executable()`
---
---@param self Gio.AppInfo
---@return string
function AppInfo.get_executable(self) end

--- ## Instance method `AppInfo:get_icon()`
---
---@param self Gio.AppInfo
---@return Gio.Icon|nil
function AppInfo.get_icon(self) end

--- ## Instance method `AppInfo:get_id()`
---
---@param self Gio.AppInfo
---@return string|nil
function AppInfo.get_id(self) end

--- ## Instance method `AppInfo:get_name()`
---
---@param self Gio.AppInfo
---@return string
function AppInfo.get_name(self) end

--- ## Instance method `AppInfo:get_supported_types()`
---
---@param self Gio.AppInfo
---@return string[]|{}
function AppInfo.get_supported_types(self) end

--- ## Instance method `AppInfo:launch()`
---
---@param self Gio.AppInfo
---@param files? Gio.File[]
---@param context? Gio.AppLaunchContext
---@param error? GLib.Error
---@return boolean
function AppInfo.launch(self, files, context, error) end

--- ## Instance method `AppInfo:launch_uris()`
---
---@param self Gio.AppInfo
---@param uris? string[]
---@param context? Gio.AppLaunchContext
---@param error? GLib.Error
---@return boolean
function AppInfo.launch_uris(self, uris, context, error) end

--- ## Instance method `AppInfo:launch_uris_async()`
---
---@param self Gio.AppInfo
---@param uris? string[]
---@param context? Gio.AppLaunchContext
---@param cancellable? Gio.Cancellable
---@param callback? Gio.AsyncReadyCallback
---@param user_data? any
function AppInfo.launch_uris_async(self, uris, context, cancellable, callback, user_data) end

--- ## Instance method `AppInfo:launch_uris_finish()`
---
---@param self Gio.AppInfo
---@param result Gio.AsyncResult
---@param error? GLib.Error
---@return boolean
function AppInfo.launch_uris_finish(self, result, error) end

--- ## Instance method `AppInfo:remove_supports_type()`
---
---@param self Gio.AppInfo
---@param content_type string
---@param error? GLib.Error
---@return boolean
function AppInfo.remove_supports_type(self, content_type, error) end

--- ## Instance method `AppInfo:set_as_default_for_extension()`
---
---@param self Gio.AppInfo
---@param extension string
---@param error? GLib.Error
---@return boolean
function AppInfo.set_as_default_for_extension(self, extension, error) end

--- ## Instance method `AppInfo:set_as_default_for_type()`
---
---@param self Gio.AppInfo
---@param content_type string
---@param error? GLib.Error
---@return boolean
function AppInfo.set_as_default_for_type(self, content_type, error) end

--- ## Instance method `AppInfo:set_as_last_used_for_type()`
---
---@param self Gio.AppInfo
---@param content_type string
---@param error? GLib.Error
---@return boolean
function AppInfo.set_as_last_used_for_type(self, content_type, error) end

--- ## Instance method `AppInfo:should_show()`
---
---@param self Gio.AppInfo
---@return boolean
function AppInfo.should_show(self) end

--- ## Instance method `AppInfo:supports_files()`
---
---@param self Gio.AppInfo
---@return boolean
function AppInfo.supports_files(self) end

--- ## Instance method `AppInfo:supports_uris()`
---
---@param self Gio.AppInfo
---@return boolean
function AppInfo.supports_uris(self) end
