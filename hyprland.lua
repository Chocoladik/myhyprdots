hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprland-session.target")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("wayland-pipewire-idle-inhibit -w")
	hl.exec_cmd("rfkill unblock bluetooth")
	hl.exec_cmd("hyprpm reload")
	hl.exec_cmd("wvkbd-deskintl --hidden -L 360")
end)

hl.config({
	input = {
		touchpad = {
			natural_scroll = true,
			tap_to_click = true,
			clickfinger_behavior = true,
		},
		follow_mouse = 0,
		touchdevice = {
			enabled = true,
		},
	},
	general = {
		layout = "scrolling",
	},
	decoration = {
		active_opacity = 1.0,
		inactive_opacity = 0.9,
		fullscreen_opacity = 1.0,
		dim_inactive = true,
		shadow = {
			enabled = false,
		},
		blur = {
			enabled = false,
			size = 9,
			passes = 3,
			xray = false,
			popups = true,
		},
	},
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = true,
		key_press_enables_dpms = false,
		animate_mouse_windowdragging = true,
	},
	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
	},
	scrolling = {
		explicit_column_widths = " 0.25, 0.5, 0.75, 1.0 ",
		focus_fit_method = 1,
		wrap_focus = false,
		wrap_swapcol = false,
	},
	--[[plugin = {
		touch_gestures = {
			sensitivity = 8.0,
			edge_margin = 20,
			long_press_delay = 200,
			workspace_swipe = false,
			workspace_swipe_fingers = 3,
			workspace_swipe_edge = 0,
			resize_on_border_long_press = true,
			["hyprgrass-bind"] = {
				", edge:r:l, layoutmsg, move +col",
				", edge:l:r, layoutmsg, move -col",
				", pinch:4:i, fullscreen",
				", pinch:4:o, killactive",
				", edge:d:u, exec, kill -34 $(ps -C wvkbd-deskintl)",
			},
		},
	},]]
})
hl.device({
	name = "keychron-keychron-v3",
	kb_layout = "de",
	hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("dms ipc call mpris playPause"), { locked = true }),
})

hl.device({
	name = "at-translated-set-2-keyboard",
	kb_layout = "us, ru",
})

hl.exec_cmd("hyprctl keyword gestures:gesture '3, vertical, workspace'")
hl.exec_cmd("hyprctl keyword gestures:gesture '3, left, dispatcher, movefocus, r'")
hl.exec_cmd("hyprctl keyword gestures:gesture '3, right, dispatcher, movefocus, l'")

hl.animation({ leaf = "windowsIn", enabled = true, speed = 6, bezier = "default", style = "popin" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 6, bezier = "default", style = "popin" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "default", style = "slidevert" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 6, bezier = "default", style = "gnomed" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "border", enabled = false })

hl.gesture({ fingers = 3, direction = "vertical", action = "workspace" })
hl.gesture({
	fingers = 3,
	direction = "left",
	action = function()
		hl.dispatch(hl.dsp.focus({ direction = "r" }))
	end,
})
hl.gesture({
	fingers = 3,
	direction = "right",
	action = function()
		hl.dispatch(hl.dsp.focus({ direction = "l" }))
	end,
})

hl.window_rule({ match = { class = "^(org\\.quickshell)$" }, float = true })
hl.layer_rule({ match = { namespace = "^(quickshell)$" }, no_anim = true })
hl.layer_rule({ match = { namespace = "^dms:.*" }, no_anim = true })
hl.window_rule({ match = { fullscreen = 1 }, idle_inhibit = "none" })
hl.window_rule({ match = { class = "steam" }, float = true })
hl.window_rule({ match = { class = "flameshot" }, no_anim = true, float = true })
hl.window_rule({ match = { title = "Media viewer" }, float = true })
hl.window_rule({ match = { title = "Blanket" }, float = true })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, float = true })
hl.window_rule({ match = { title = "Picture-in-Picture" }, float = true, no_anim = true })

require("dms/colors")
require("dms/outputs")
require("dms/layout")
require("dms/cursor")
require("dms/binds")
require("dms/windowrules")
---require("scrolloverview")
