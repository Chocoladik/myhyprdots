{ pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    plugins = [
      #inputs.hyprgrass.packages.${pkgs.system}.default
      #inputs.scrolloverview.packages.${pkgs.system}.default
    ];

    # Hyprland configuration 
    extraConfig = ''
      hl.on("hyprland.start", function()
        hl.exec_cmd("rfkill unblock bluetooth")
        hl.exec_cmd("wayland-pipewire-idle-inhibit -w")
        ---hl.exec_cmd("wvkbd-deskintl --hidden -L 360")
      end)
	
	hl.env("HYPRCURSOR_THEME", "Adwaita")
	hl.env("XCURSOR_THEME", "Adwaita")
	hl.env("HYPRCURSOR_SIZE", "24")
	hl.env("XCURSOR_SIZE", "24")

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
          border_size = 5,
	  gaps_out = 5,
	  gaps_in = 4,
          resize_on_border = false,
        },
        decoration = {
          active_opacity = 1.0,
          inactive_opacity = 0.9,
          fullscreen_opacity = 1.0,
          dim_inactive = true,
          rounding = 8,
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
          column_width = 0.75,
          explicit_column_widths = " 0.25, 0.5, 0.75, 1.0 ",
          focus_fit_method = 1,
          wrap_focus = false,
          wrap_swapcol = false,
	  follow_min_visible = 0.1,
        },
        cursor = {
          hide_on_key_press = true,
          hide_on_touch = true,
          inactive_timeout = 3,
    },
      })

      hl.monitor({ output = "eDP-1", mode = "1920x1080@60.049", position = "0x0", scale = 1, vrr = 0 })

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

      hl.curve("rubber", { type = "spring", mass = 1, stiffness = 190, dampening = 20 })
      hl.animation({ leaf = "windowsIn", enabled = true, speed = 4, bezier = "default", style = "popin" })
      hl.animation({ leaf = "windowsOut", enabled = true, speed = 6, bezier = "default", style = "popin" })
      hl.animation({ leaf = "workspaces", enabled = true, speed = 1, spring = "rubber", style = "slidevert" })
      hl.animation({ leaf = "windowsMove", enabled = true, speed = 6, spring = "rubber", style = "gnomed" })
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
      hl.layer_rule({ match = { namespace = "^dms:bar$" }, xray = true, })
      hl.window_rule({ match = { fullscreen = 1 }, idle_inhibit = "none" })
      hl.window_rule({ match = { class = "steam" }, float = true })
      hl.window_rule({ match = { class = "flameshot" }, no_anim = true, float = true })
      hl.window_rule({ match = { title = "Media viewer" }, float = true })
      hl.window_rule({ match = { title = "Blanket" }, float = true })
      hl.window_rule({ match = { title = "Picture-in-Picture" }, float = true, no_anim = true })

      require("dms/colors")
      ---require("scrolloverview")
      ---require("hyprgrass")

      --- Keybinds
      hl.bind("CTRL + Print", hl.dsp.exec_cmd("dms ipc call quickCapture screenshot full edit"))
      hl.bind("SUPER + Print", hl.dsp.exec_cmd("dms ipc call quickCapture screenshot window edit"))
      hl.bind("Print", hl.dsp.exec_cmd("dms ipc call quickCapture screenshot region edit"))
      hl.bind("SUPER + N", hl.dsp.exec_cmd("nautilus"))
      hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"))
      hl.bind("SUPER + P", hl.dsp.exec_cmd("dms ipc call powermenu toggle"))

      hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("dms ipc call audio micmute"), { locked = true })
      hl.bind("XF86AudioMute", hl.dsp.exec_cmd("dms ipc call audio mute"), { locked = true })
      hl.bind("XF86AudioNext", hl.dsp.exec_cmd("dms ipc call mpris next"), { locked = true })
      hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("dms ipc call mpris play"), { locked = true })
      hl.bind("XF86AudioPause", hl.dsp.exec_cmd("dms ipc call mpris pause"), { locked = true })
      hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("dms ipc call mpris previous"), { locked = true })
      hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call audio decrement 10"), { locked = true, repeating = true })
      hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call audio increment 10"), { locked = true, repeating = true })

      hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("dms ipc call brightness decrement 1 backlight:intel_backlight"), { locked = true })
      hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("dms ipc call brightness increment 1 backlight:intel_backlight"), { locked = true })
      hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("dms ipc call brightness decrement 5 backlight:intel_backlight"), { locked = true, repeating = true })
      hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("dms ipc call brightness increment 5 backlight:intel_backlight"), { locked = true, repeating = true })

      hl.bind("ALT + Space", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
      hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("dms ipc call processlist focusOrToggle"))
      hl.bind("SUPER + Comma", hl.dsp.exec_cmd("dms ipc call settings focusOrToggle"))
      hl.bind("SUPER + V", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
      hl.bind("SUPER + W", hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"))
      hl.bind("SUPER + L", hl.dsp.exec_cmd("dms ipc call lock lock"))

      hl.bind("SUPER + B", function()
        hl.timer(function()
          hl.dispatch(hl.dsp.dpms({ action = "disable" }))
        end, { timeout = 100, type = "oneshot" })
      end)
      hl.bind("SUPER + Space", hl.dsp.exec_cmd("hyprctl switchxkblayout at-translated-set-2-keyboard next"), { locked = true })

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
      
      hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
      hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

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
    '';
  };
}
