{ inputs, pkgs, ... }:

{
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
  services.ratbagd.enable = true;
  services.gvfs.enable = true;
  services.devmon.enable = true;
  services.flatpak.enable = true;
  services.mullvad-vpn.enable = true;
  services.spotifyd.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = {
        user = "aktire";
        command = "uwsm start start-hyprland";
      };
    };
  };
  services.fwupd.enable = true;
  programs.fuse.userAllowOther = true;
  programs.kdeconnect.enable = true;
  environment.systemPackages = [
    pkgs.ffmpeg-full
    pkgs.libavif
    pkgs.git
    pkgs.gh
    pkgs.neovim
    pkgs.xdg-user-dirs
    pkgs.pulseaudio
    pkgs.wayland-pipewire-idle-inhibit
    pkgs.glib
    pkgs.gsettings-desktop-schemas
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
