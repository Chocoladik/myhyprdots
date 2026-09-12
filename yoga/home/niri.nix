{ inputs, pkgs, ... }:
{
programs.niri = {
  enable = true;
  package = pkgs.niri;
  config = ''
//include "dms/alttab.kdl"
//include "dms/colors.kdl"
//include "dms/input.kdl"
//include "dms/layout.kdl"
//include "dms/windowrules.kdl"
//include "dms/wpblur.kdl"

spawn-at-startup "rfkill" "unblock" "bluetooth"
spawn-at-startup "wayland-pipewire-idle-inhibit" "-w"

environment {
    HYPRCURSOR_THEME "Adwaita"
    XCURSOR_THEME "Adwaita"
    HYPRCURSOR_SIZE "24"
    XCURSOR_SIZE "24"
}

input {
    keyboard {
        xkb {
            layout "us,ru"
        }
    }

    touchpad {
        tap
        natural-scroll
        accel-profile "flat"
    }

    mouse {
        off
    }
}

layout {
    gaps 5
    center-focused-column "never"

    border {
        width 5
        active-color "#7aa2f7"
        inactive-color "#414868"
    }

    preset-column-widths {
        proportion 0.25
        proportion 0.50
        proportion 0.75
        proportion 1.00
    }

    default-column-width { proportion 0.75; }
    focus-ring { off; }
}

output "eDP-1" {
    mode "1920x1080@60.049"
    position x=0 y=0
    scale 1.0
}

window-rule {
    match app-id="^(org\\.quickshell)$"
    open-floating true
}

window-rule {
    match app-id="steam"
    open-floating true
}

window-rule {
    match app-id="flameshot"
    open-floating true
    block-out-from "screen-capture"
}

window-rule {
    match title="Media viewer"
    open-floating true
}

window-rule {
    match title="Blanket"
    open-floating true
}

window-rule {
    match title="Picture-in-Picture"
    open-floating true
}

binds {
    Ctrl+Print { spawn "dms" "ipc" "call" "quickCapture" "screenshot" "full" "edit"; }
    Super+Print { spawn "dms" "ipc" "call" "quickCapture" "screenshot" "window" "edit"; }
    Print { spawn "dms" "ipc" "call" "quickCapture" "screenshot" "region" "edit"; }

    Super+N { spawn "nautilus"; }
    Super+T { spawn "kitty"; }
    Super+P { spawn "dms" "ipc" "call" "powermenu" "toggle"; }

    XF86AudioMicMute allow-when-locked=true { spawn "dms" "ipc" "call" "audio" "micmute"; }
    XF86AudioMute allow-when-locked=true { spawn "dms" "ipc" "call" "audio" "mute"; }
    XF86AudioNext allow-when-locked=true { spawn "dms" "ipc" "call" "mpris" "next"; }
    XF86AudioPlay allow-when-locked=true { spawn "dms" "ipc" "call" "mpris" "playPause"; }
    XF86AudioPause allow-when-locked=true { spawn "dms" "ipc" "call" "mpris" "pause"; }
    XF86AudioPrev allow-when-locked=true { spawn "dms" "ipc" "call" "mpris" "previous"; }
    XF86AudioLowerVolume allow-when-locked=true repeat=true { spawn "dms" "ipc" "call" "audio" "decrement" "10"; }
    XF86AudioRaiseVolume allow-when-locked=true repeat=true { spawn "dms" "ipc" "call" "audio" "increment" "10"; }

    Shift+XF86MonBrightnessDown allow-when-locked=true { spawn "dms" "ipc" "call" "brightness" "decrement" "1" "backlight:intel_backlight"; }
    Shift+XF86MonBrightnessUp allow-when-locked=true { spawn "dms" "ipc" "call" "brightness" "increment" "1" "backlight:intel_backlight"; }
    XF86MonBrightnessDown allow-when-locked=true repeat=true { spawn "dms" "ipc" "call" "brightness" "decrement" "5" "backlight:intel_backlight"; }
    XF86MonBrightnessUp allow-when-locked=true repeat=true { spawn "dms" "ipc" "call" "brightness" "increment" "5" "backlight:intel_backlight"; }

    Alt+Space { spawn "dms" "ipc" "call" "spotlight" "toggle"; }
    Ctrl+Alt+Delete { spawn "dms" "ipc" "call" "processlist" "focusOrToggle"; }
    Super+Comma { spawn "dms" "ipc" "call" "settings" "focusOrToggle"; }
    Super+V { spawn "dms" "ipc" "call" "clipboard" "toggle"; }
    Super+W { spawn "dms" "ipc" "call" "dankdash" "wallpaper"; }
    Super+L { spawn "dms" "ipc" "call" "lock" "lock"; }
    Super+B { power-off-monitors; }
    Super+Space { switch-layout "next"; }

    Super+G { toggle-window-floating; }
    Super+Ctrl+Q { close-window; }

    Super+Left  { focus-column-left; }
    Super+Right { focus-column-right; }
    Super+Down  { focus-window-down; }
    Super+Up    { focus-window-up; }

    Super+Shift+Left  { move-column-left; }
    Super+Shift+Right { move-column-right; }
    Super+Shift+Down  { move-window-down; }
    Super+Shift+Up    { move-window-up; }

    Super+F { switch-preset-column-width; }
    Super+U { consume-or-expel-window-left; }
    Super+I { consume-or-expel-window-right; }
    Super+R { reset-window-height; }
    F11     { fullscreen-window; }

    Super+1 { focus-workspace 1; }
    Super+2 { focus-workspace 2; }
    Super+3 { focus-workspace 3; }
    Super+4 { focus-workspace 4; }
    Super+5 { focus-workspace 5; }
    Super+6 { focus-workspace 6; }
    Super+7 { focus-workspace 7; }
    Super+8 { focus-workspace 8; }
    Super+9 { focus-workspace 9; }
    Super+Page_Down { focus-workspace-down; }
    Super+Page_Up   { focus-workspace-up; }

    Super+Ctrl+1 { move-column-to-workspace 1; }
    Super+Ctrl+2 { move-column-to-workspace 2; }
    Super+Ctrl+3 { move-column-to-workspace 3; }
    Super+Ctrl+4 { move-column-to-workspace 4; }
    Super+Ctrl+5 { move-column-to-workspace 5; }
    Super+Ctrl+6 { move-column-to-workspace 6; }
    Super+Ctrl+7 { move-column-to-workspace 7; }
    Super+Ctrl+8 { move-column-to-workspace 8; }
    Super+Ctrl+9 { move-column-to-workspace 9; }
}
  '';
  };
}
