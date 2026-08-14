{ pkgs, ... }:

{
  services.upower.enable = true;
  services.thermald.enable = true;
  services.libinput.enable = true;
  services.gvfs.enable = true;
  services.devmon.enable = true;
  services.flatpak.enable = true;
  services.mullvad-vpn.enable = true;
  services.spotifyd.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.fuse.userAllowOther = true;

  # Strictly essential system administration & recovery tools
  environment.systemPackages = with pkgs; [
    git
    gh
    neovim
    tuigreet
    xdg-user-dirs
    pulseaudio
    wayland-pipewire-idle-inhibit
    glib
    gsettings-desktop-schemas
    pciutils
    usbutils
  ];
}
