-- Normally you would use your existing bars, but for this example, we add one
local lb = awful.widget.layoutbox(screen[1])
local l = wibox.layout.align.horizontal(nil, lb, nil)
l.expand = "outside"
awful.wibar({ widget = l })

local p = awful.popup({
	widget = wibox.widget({
		awful.widget.layoutlist({
			source = awful.widget.layoutlist.source.default_layouts,
			screen = 1,
			base_layout = wibox.widget({
				spacing = 5,
				column_count = 3,
				layout = wibox.layout.grid.vertical,
			}),
			widget_template = {
				{
					{
						id = "icon_role",
						forced_height = 22,
						forced_width = 22,
						widget = wibox.widget.imagebox,
					},
					margins = 4,
					widget = wibox.container.margin,
				},
				id = "background_role",
				forced_width = 24,
				forced_height = 24,
				shape = gears.shape.rounded_rect,
				widget = wibox.container.background,
			},
		}),
		margins = 4,
		widget = wibox.container.margin,
	}),
	preferred_anchors = "middle",
	border_color = beautiful.border_color,
	border_width = beautiful.border_width,
	shape = gears.shape.infobubble,
})
p:bind_to_widget(lb)
