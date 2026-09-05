{ pkgs, ... }:

{
  services.upower.enable = true;
  services.thermald.enable = true;
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
    };
  };

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "hyprland";
    configHome = "/home/aktire";
  };

  programs.fuse.userAllowOther = true;
  environment.systemPackages = with pkgs; [
    git
    gh
    neovim
    xdg-user-dirs
    pulseaudio
    wayland-pipewire-idle-inhibit
    glib
    gsettings-desktop-schemas
    pciutils
    usbutils
  ];
}
