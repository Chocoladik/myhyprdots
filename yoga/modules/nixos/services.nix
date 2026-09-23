{ inputs, pkgs, lib, ... }:

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
      --remember-session \
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
  programs.ydotool.enable = true;
  services.gvfs.enable = true;

  services.ratbagd.enable = true;
  services.devmon.enable = true;
  services.hardware.openrgb.enable = true;

  services.mullvad-vpn.enable = true;
  services.spotifyd.enable = false;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

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
  services.fwupd.enable = true;
  programs.fuse.userAllowOther = true;
  services.gnome.tinysparql.enable = true;
  services.gnome.localsearch.enable = true;
  programs.kdeconnect.enable = true;
  environment.systemPackages = [
    pkgs.tuigreet
    pkgs.ffmpeg-full
    pkgs.libavif
    pkgs.git
    pkgs.gh
    pkgs.neovim
    pkgs.ripgrep
    pkgs.fd
    pkgs.lua-language-server
    pkgs.stylua
    pkgs.nixd   
    pkgs.nixfmt   
    pkgs.xdg-user-dirs
    pkgs.pulseaudio
    pkgs.wayland-pipewire-idle-inhibit
    pkgs.glib
    pkgs.gsettings-desktop-schemas
    pkgs.openrgb
    pkgs.pciutils
    pkgs.usbutils
    (pkgs.symlinkJoin {
    name = "zen-browser";
    paths = [ inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/zen \
        --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath [ pkgs.ffmpeg.lib ]}
    '';
  })
  ];
}
