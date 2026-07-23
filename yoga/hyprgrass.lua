hl.config({
	plugin = {
		hyprgrass = {
			sensitivity = 3.0,
			edge_margin = 20,
			long_press_delay = 100,
			resize_on_border_long_press = true,
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
