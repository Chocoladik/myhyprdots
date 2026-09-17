{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hyprland.nix
    ./dms.nix
    ./git.nix
    ./kitty.nix
    ./flatpak.nix
    ./fish.nix
    ./xournalpp.nix
    ./matugen.nix
    inputs.areofyl-fetch.homeManagerModules.default
  ];

  home.username = "aktire";
  home.homeDirectory = "/home/aktire";
  programs.fetch.enable = true;
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      shell = "fish";
    };
  };

  # GTK Configuration
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
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

  # Environment variables
    home.sessionVariables = {
    GTK_THEME = "adw-gtk3-dark";
    GTK_CSD = "1";
    COLORSCHEME = "dark";
  };

  home.packages = with pkgs; [
    home-manager
    kitty
    btop
    ydotool
    piper
    android-tools
    poppler-utils
    ghostscript
    vscodium
    mpv
    loupe
    img2pdf
    zbar
    imagemagick
    krita
    darktable
    ausweisapp
    tesseract
    curl
    papers
    baobab
    xournalpp
    nautilus
    gnome-text-editor
    adw-gtk3
    adwaita-icon-theme
    qt6Packages.qt6ct
    vesktop
    chromium
    materialgram
    spotifyd
    spicetify-cli
    mullvad
    qbittorrent
    onlyoffice-desktopeditors
    fluent-icon-theme
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
}
