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
  ];

  home.username = "aktire";
  home.homeDirectory = "/home/aktire";
  
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

  # Environment variables
    home.sessionVariables = {
    GTK_THEME = "adw-gtk3-dark";
    GTK_CSD = "1";
    COLORSCHEME = "dark";
  };

  home.packages = with pkgs; [
    home-manager
    kitty
    fetch
    wvkbd
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
    zen-browser
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
