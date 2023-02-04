---@meta

---@alias wibox.widget._args table

---@class wibox.widget._static : gears.object._static
-- -@field background wibox.container.background
---@field base wibox.widget.base
---@field calendar wibox.widget.calendar
---@field checkbox wibox.widget.checkbox
---@field graph wibox.widget.graph
---@field imagebox wibox.widget.imagebox
---@field init wibox.widget.init
---@field piechart wibox.widget.piechart
---@field progressbar wibox.widget.progressbar
---@field separator wibox.widget.separator
---@field slider wibox.widget.slider
---@field systray wibox.widget.systray
---@field textbox wibox.widget.textbox
---@field textclock wibox.widget.textclock
local widget_static = {}

---@type wibox.container.background
---@deprecated Use `wibox.container.background` instead.
widget_static.background = nil


---@param wdg wibox.widget widget
---@param cr cairo_context
---@param width number
---@param height number
---@param context { dpi: 96 }
function widget_static:draw_to_cairo_context(wdg, cr, width, height, context) end


---@param wdg wibox.widget widget
---@param path string
---@param width number
---@param height number
---@param context { dpi: 96 }
function widget_static:draw_to_svg_file(wdg, path, width, height, context) end


---@param wdg wibox.widget widget
---@param width number
---@param height number
---@param format cairo.Format
---@param context { dpi: 96 }
function widget_static:draw_to_image_surface(wdg, width, height, format, context) end

---@class wibox.widget : wibox.widget._static, gears.object
local widget = {}

---@param role string
---@return table
function widget:get_children_by_id(role) end
