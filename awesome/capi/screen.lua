---@meta

---@class screen._sub._geometry
---@field x integer
---@field y integer
---@field width integer
---@field height integer

---@class screen._sub.padding
---@field left integer|nil
---@field right integer|nil
---@field top integer|nil
---@field bottom integer|nil

---@class screen._sub.output
---@field mm_width integer The screen physical width.
---@field mm_height integer The screen physical height.
---@field name string The output name.
---@field viewport_id string The identifier of the viewport this output corresponds to.

---@class screen._sub.struts
---@field left integer?
---@field right integer?
---@field top integer?
---@field bottom integer?

--- # Module: screen
---
--- A physical or virtual screen object.
---
--- Screen objects can be added and removed over time. To get a callback for all current and future screens, use `awful.screen.connect_for_each_screen`:
---
--- ```
--- awful.screen.connect_for_each_screen(function(s)
--- 	-- do something
--- end)
--- ```
---
--- It is also possible loop over all current screens using:
---
--- ```
--- for s in screen do
--- 	-- do something
--- end
--- ```
---
--- Most basic Awesome objects also have a screen property, see `mouse.screen`, `client.screen`, `wibox.screen` and `tag.screen`.
---
---@class screen
---@operator call: screen Iterate over screens.
---@field primary screen The primary screen.
---@field geometry screen._sub._geometry The screen coordinates and dimensions.
---@field index integer The internal screen number.
---@field workarea screen._sub._geometry The screen workarea.
---@field tiling_area screen._sub._geometry The area where clients can be tiled.
---@field content raw_surface Take a screenshot of the physical screen.
---@field padding screen._sub.padding|number The screen padding.
---@field outputs screen._sub.output[] A list of outputs for this screen with their size in mm.
---@field clients client[] The list of visible clients for the screen. Minimized and unmanaged clients are not included in this list as they are technically not on the screen.
---@field hidden_clients client[] Get the list of clients assigned to the screen but not currently visible.
---@field all_clients client[] All clients assigned to the screen.
---@field tiled_clients client[] Tiled clients for the screen.
---@field tags tag[] A list of all tags on the screen.
---@field selected_tags tag[] A list of all selected tags on the screen.
---@field selected_tag tag? The first selected tag.
---@field dpi number The number of pixels per inch of the screen.
---@field minimum_dpi number The lowest density DPI from all of the (physical) outputs.
---@field maximum_dpi number The highest density DPI from all of the (physical) outputs.
---@field preferred_dpi number The preferred DPI from all of the (physical) outputs.
---@field mm_maximum_size number The maximum diagonal size in millimeters.
---@field mm_minimum_size number The minimum diagonal size in millimeters.
---@field inch_maximum_size number The maximum diagonal size in inches.
---@field inch_minimum_size number The minimum diagonal size in inches.
local cls = {}

-- Constructors

--- ## Add a fake screen.
---
--- To vertically split the first screen in 2 equal parts, use:
---
--- ```
--- local geo = screen[1].geometry
--- local new_width = math.ceil(geo.width/2)
--- local new_width2 = geo.width - new_width
--- screen[1]:fake_resize(geo.x, geo.y, new_width, geo.height)
--- screen.fake_add(geo.x + new_width, geo.y, new_width2, geo.height)
--- ```
---
--- Both virtual screens will have their own taglist and wibars.
---@param x integer X-coordinate for screen.
---@param y integer Y-coordinate for screen.
---@param width integer Width for screen.
---@param height integer Height for screen.
function cls.fake_add(x, y, width, height) end

-- Static module functions

--- ## Get the number of instances.
---@return integer instances The number of instances.
function cls.instances() end

--- ## Get the number of screens.
---@return integer instances The number of screens.
function cls.count() end

-- Object methods

--- ## Remove a screen.
---@param self screen
function cls:fake_remove() end

--- ## Resize a screen.
---
--- Calling this will resize the screen even if it no longer matches the viewport size.
---@param self screen
---@param x integer The new X-coordinate for screen.
---@param y integer The new Y-coordinate for screen.
---@param width integer The new width for screen.
---@param height integer The new height for screen.
function cls:fake_resize(x, y, width, height) end

--- ## Swap a screen with another one in global screen list.
---@param self screen
---@param s screen
function cls:swap(s) end

--- ## Get the square distance between a screen and a point.
---@param self screen
---@param x number X coordinate of point
---@param y number Y coordinate of point
function cls:get_square_distance(x, y) end

--- ## Get the next screen in a specific direction.
---
--- This gets the next screen relative to this one in the specified direction.
---@param self screen
---@param dir "up"|"down"|"left"|"right" The direction
---@return screen|nil
function cls:get_next_in_direction(dir) end

---@class screen._args.get_bounding_geometry
---@field honor_padding bool|nil
---@field honor_workarea bool|nil
---@field margins screen._sub.padding|integer|nil
---@field tag tag|nil
---@field parent drawable|nil
---@field bounding_rect screen._sub._geometry|nil

--- ## Get a placement bounding geometry.
---
--- This method computes the different variants of the "usable" screen geometry.
---@param self screen
---@param args screen._args.get_bounding_geometry
---@return screen._sub._geometry
function cls:get_bounding_geometry(args) end

--- ## Get the list of visible clients for the screen.
---
--- This is used by `screen.clients` internally (with `stacked = true`).
---@param self screen
---@param stacked? bool Use stacking order? (top to bottom)
---@return client[] clients The clients list.
function cls:get_clients(stacked) end

--- ## Get all clients assigned to the screen.
---
--- This is used by `screen.all_clients` internally (with `stacked = true`).
---@param self screen
---@param stacked? bool Use stacking order? (top to bottom)
---@return client[] all_clients The clients list.
function cls:get_all_clients(stacked) end

--- ## Get tiled clients for the screen.
---
--- This is used by `screen.tiles_clients` internally (with `stacked = true`).
---@param self screen
---@param stacked? bool Use stacking order? (top to bottom)
---@return client[] tiled_clients The clients list.
function cls:get_tiled_clients(stacked) end

--- ## Split the screen into multiple screens.
---
---@param self screen
---@param ratios? {[1]: integer, [2]: integer} The different ratios to split into. If none is provided, it is split in half.
---@param mode? "vertical"|"horizontal" The axis. If none is specified, it will split along the longest axis.
---@return {[1]: screen, [2]: screen} screen_parts A table with the screen objects. The first value is the original screen object (`s`) and the following one(s) are the new screen objects. The values are ordered from left to right or top to bottom depending on the value of `mode`.
function cls:split(ratios, mode) end

--- ## Connect to a signal.
---@param self screen
---@param name string The name of the signal.
---@param func function The callback to call when the signal is emitted.
function cls:connect_signal(name, func) end

--- ## Connect to a signal weakly.
---
--- This allows the callback function to be garbage collected and automatically disconnects the signal when that happens.
---
--- **Warning:** Only use this function if you really, really, *really* know what you are doing.
---@param self screen
---@param name string The name of the signal.
---@param func function The callback to call when the signal is emitted.
function cls:weak_connect_signal(name, func) end

--- ## Emit a signal.
---@param self screen
---@param name string The name of the signal.
---@vararg ...  	Extra arguments for the callback functions. Each connected function receives the object as first argument and then any extra arguments that are given to emit_signal().
function cls:emit_signal(name, ...) end

--- ## Disconnect from a signal.
---@param self screen
---@param name string The name of the signal.
---@param func function The callback that should be disconnected.
function cls:disconnect_signal(name, func) end
