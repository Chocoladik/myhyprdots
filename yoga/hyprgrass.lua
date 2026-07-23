hl.config({
	plugin = {
		hyprgrass = {
			sensitivity = 4.0,
			edge_margin = 40,
			long_press_delay = 200,
			resize_on_border_long_press = true,
			["hyprgrass-bind"] = {
				", edge:r:l, layoutmsg, move +col",
				", edge:l:r, layoutmsg, move -col",
				", pinch:4:i, fullscreen",
				", pinch:4:o, killactive",
				", edge:d:u, exec, kill -34 $(ps -C wvkbd-deskintl)",
			},
		},
	},
})

hl.plugin.hyprgrass.gesture({
	pattern = { kind = "swipe", fingers = 3, direction = "vertical" },
	action = "workspace",
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "edge", origin = "right", direction = "left" },
	action = hl.dsp.focus({ direction = "r" }),
})
hl.plugin.hyprgrass.bind({
	pattern = { kind = "edge", origin = "left", direction = "right" },
	action = hl.dsp.focus({ direction = "l" }),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "pinch", fingers = 4, direction = "pinchin" },
	action = hl.dsp.window.fullscreen({ mode = "fullscreen", action = toggle }),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "pinch", fingers = 4, direction = "pinchout" },
	action = hl.dsp.window.close({}),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "edge", origin = "down", direction = "up" },
	action = hl.dsp.exec_cmd("pkill -SIGRTMIN wvkbd-deskintl"),
})
