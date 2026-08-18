{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./dms.nix
    ./git.nix
    ./kitty.nix
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

  programs.fish = {
    enable = true;
    interactiveShellInit = "";
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
    kitty
    fetch
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
