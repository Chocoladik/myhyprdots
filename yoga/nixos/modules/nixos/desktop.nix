{ pkgs, inputs, ... }:

{
  programs.dconf.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };


  qt.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];
    config = {
      hyprland.default = [ "hyprland" "gtk" ];
      common.default = [ "hyprland" "gtk" ];
      common."org.freedesktop.impl.portal.Settings" = [ "gtk" ];
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GTK_CSD = "0";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    XDG_SCREENSHOT_BACKEND = "hyprland";
  };

  programs.dank-material-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableVPN = true;
  };
}
