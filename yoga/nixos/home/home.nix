{ pkgs, ... }:

{
  imports = [
    ./hyprland.nix
  ];

  home.username = "aktire";
  home.homeDirectory = "/home/aktire";

  # GTK Configuration for Dark Mode & Single "Close" CSD Button
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-decoration-layout = "appmenu:close";
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-decoration-layout = "appmenu:close";
    };
  };

  # Environment variables for dark mode consistency
  home.sessionVariables = {
    GTK_THEME = "adw-gtk3-dark";
    GTK_CSD = "1";
    COLORSCHEME = "dark";
  };

  # Ensures DMS Matugen dynamic colors hook location exists
  xdg.configFile."hypr/dms/colors.lua".text = ''
    -- Auto-generated dynamic colors placeholder for DMS Matugen
  '';

  home.packages = with pkgs; [
    kitty
    wvkbd
    android-tools
    poppler-utils
    ghostscript
    btop
    vscodium
    mpv
    loupe
    papers
    baobab
    xournalpp
    nautilus
    gnome-text-editor
    adw-gtk3
    adwaita-icon-theme
    vesktop
    chromium
    materialgram
    zen-browser
    spotifyd
    spicetify-cli
    steam
    mullvad
    qbittorrent
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
}
