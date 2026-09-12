{ inputs, pkgs, ... }:

{
  services.upower.enable = true;
  services.system76-scheduler.settings.cfsProfiles.enable = true;
  services.thermald.enable = true; 
  services.power-profiles-daemon.enable = true; 
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

  programs.fuse.userAllowOther = true;
  environment.systemPackages = [
    pkgs.ffmpeg
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
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
