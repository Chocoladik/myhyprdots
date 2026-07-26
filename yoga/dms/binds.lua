--- Applications and System Tools
hl.bind(
	"CTRL + Print",
	hl.dsp.exec_cmd(
		'hyprshot -m output -m active -f "Screenshot_$(date +%Y%m%d_%H%M%S).png" -o "/home/aktire/Pictures/Screenshots" -z'
	)
)
hl.bind("SUPER + CTRL + Space", hl.dsp.exec_cmd("quickshell -c QuickSnip -n"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("nautilus Documents/"))
hl.bind(
	"SUPER + Print",
	hl.dsp.exec_cmd(
		'hyprshot -m window -m active -f "Screenshot_$(date +%Y%m%d_%H%M%S).png" -o "/home/aktire/Pictures/Screenshots" -z'
	)
)
hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + P", hl.dsp.exec_cmd("dms ipc call powermenu toggle"))
hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))

--- Audio Controls
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("dms ipc call audio micmute"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("dms ipc call audio mute"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("dms ipc call mpris next"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("dms ipc call mpris play"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("dms ipc call mpris pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("dms ipc call mpris previous"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call audio decrement 10"), { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call audio increment 10"), { locked = true, repeating = true })

--- Brightness Controls
hl.bind(
	"SHIFT + XF86MonBrightnessDown",
	hl.dsp.exec_cmd("dms ipc call brightness decrement 1 backlight:intel_backlight"),
	{ locked = true }
)
hl.bind(
	"SHIFT + XF86MonBrightnessUp",
	hl.dsp.exec_cmd("dms ipc call brightness increment 1 backlight:intel_backlight"),
	{ locked = true }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("dms ipc call brightness decrement 5 backlight:intel_backlight"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("dms ipc call brightness increment 5 backlight:intel_backlight"),
	{ locked = true, repeating = true }
)

--- DMS IPC Services
hl.bind("ALT + Space", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("dms ipc call processlist focusOrToggle"))
hl.bind("SUPER + Comma", hl.dsp.exec_cmd("dms ipc call settings focusOrToggle"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"))
hl.bind("SUPER + L", hl.dsp.exec_cmd("dms ipc call lock lock"))

--- Keyboard and Display
hl.bind("SUPER + B", function()
	hl.timer(function()
		hl.dispatch(hl.dsp.dpms({ action = "disable" }))
	end, { timeout = 100, type = "oneshot" })
end)
hl.bind(
	"SUPER + Space",
	hl.dsp.exec_cmd("hyprctl switchxkblayout at-translated-set-2-keyboard next"),
	{ locked = true }
)

--- Window Management and Layout
hl.bind("SUPER + G", function()
	hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
	hl.dispatch(hl.dsp.window.resize({ x = 960, y = 600, exact = true }))
	hl.dispatch(hl.dsp.window.move({ x = 550, y = 250, exact = true }))
end)

hl.bind("SUPER + CTRL + Q", hl.dsp.window.close())
hl.bind("SUPER + Left", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + Right", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + Down", hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + Up", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + F", hl.dsp.layout("fit active"))
hl.bind("SUPER + U", hl.dsp.layout("consume_or_expel prev"))
hl.bind("SUPER + I", hl.dsp.layout("consume_or_expel next"))
hl.bind("SUPER + SHIFT + Left", hl.dsp.layout("swapcol l"))
hl.bind("SUPER + SHIFT + Right", hl.dsp.layout("swapcol r"))
hl.bind("SUPER + SHIFT + Down", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + SHIFT + Up", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + R", hl.dsp.layout("colresize +conf"))
hl.bind("F11", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
-- Mouse Binds
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

--- Workspace Navigation
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = "4" }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = "5" }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = "6" }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = "7" }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = "8" }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = "9" }))
hl.bind("SUPER + Prior", hl.dsp.focus({ workspace = "-1" }))
hl.bind("SUPER + Next", hl.dsp.focus({ workspace = "+1" }))

hl.bind("SUPER + CTRL + 1", hl.dsp.window.move({ workspace = "1" }))
hl.bind("SUPER + CTRL + 2", hl.dsp.window.move({ workspace = "2" }))
hl.bind("SUPER + CTRL + 3", hl.dsp.window.move({ workspace = "3" }))
hl.bind("SUPER + CTRL + 4", hl.dsp.window.move({ workspace = "4" }))
hl.bind("SUPER + CTRL + 5", hl.dsp.window.move({ workspace = "5" }))
hl.bind("SUPER + CTRL + 6", hl.dsp.window.move({ workspace = "6" }))
hl.bind("SUPER + CTRL + 7", hl.dsp.window.move({ workspace = "7" }))
hl.bind("SUPER + CTRL + 8", hl.dsp.window.move({ workspace = "8" }))
hl.bind("SUPER + CTRL + 9", hl.dsp.window.move({ workspace = "9" }))
