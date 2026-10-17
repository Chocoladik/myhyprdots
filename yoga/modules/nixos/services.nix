{
  inputs,
  pkgs,
  lib,
  ...
}:

let
  vtColors = pkgs.writeText "tuigreet-vtrgb" ''
    10,204,18,217,26,26,26,183,31,255,57,255,26,26,26,217
    10,51,224,164,26,26,26,255,31,85,255,204,26,26,26,255
    8,17,88,65,26,26,26,202,26,51,106,102,26,26,26,224
  '';

  theme = lib.concatStringsSep ";" [
    "border=green"
    "text=gray"
    "container=black"
    "title=lightgreen"
    "greet=lightgreen"
    "prompt=green"
    "input=white"
    "time=green"
    "action=yellow"
    "button=lightyellow"
  ];

  greeterScript = pkgs.writeShellScript "tuigreet-start" ''
    set -e
    ${pkgs.kbd}/bin/setvtrgb ${vtColors}
    exec ${pkgs.tuigreet}/bin/tuigreet \
      --remember-user-session \
      --remember \
      --asterisks \
      --width 46 \
      --container-padding 3 \
      --prompt-padding 1 \
      --greeting "ROBCO INDUSTRIES (TM) TERMLINK" \
      --theme '${theme}' \
  '';
in

{
  services.flatpak.enable = true;
  programs.appimage.enable = true;

  services.upower.enable = true;
  services.thermald.enable = true;
  services.power-profiles-daemon.enable = false;
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };

  services.system76-scheduler.enable = true;
  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = "powersave";
  };

  services.libinput.enable = true;
  services.gvfs.enable = true;
  services.devmon.enable = true;
  services.ratbagd.enable = true;
  services.hardware.openrgb.enable = false;

  services.mullvad-vpn.enable = false;
  services.spotifyd.enable = false;
  programs.steam.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  programs.gpu-screen-recorder.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = {
        command = "${greeterScript}";
        user = "greeter";
      };
    };
  };

  systemd.services.NetworkManager-wait-online.enable = false;
  services.accounts-daemon.enable = true;
  services.fwupd.enable = true;
  programs.fuse.userAllowOther = true;
  services.gnome.tinysparql.enable = true;
  services.gnome.localsearch.enable = true;
  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    tuigreet
    fetch
    ffmpeg-full
    libavif
    git
    gh
    neovim
    ripgrep
    fd
    lua-language-server
    stylua
    nixd
    nixfmt
    clang-tools
    cmake
    cmake-language-server
    gdb
    gcc
    xdg-user-dirs
    pulseaudio
    wayland-pipewire-idle-inhibit
    glib
    gsettings-desktop-schemas
    openrgb
    pciutils
    usbutils
  ];
}
