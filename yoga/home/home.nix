{
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs.home-manager.enable = true;

  imports = [
    ./hyprland.nix
    ./dms.nix
    ./git.nix
    ./nvim.nix
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

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    gtk3.extraConfig.gtk-decoration-layout = "appmenu:close";
    gtk4.extraConfig.gtk-decoration-layout = "appmenu:close";
  };

  home.sessionVariables = {
    GTK_CSD = "1";
    COLORSCHEME = "dark";
  };

  xdg.desktopEntries.nvim-kitty = {
    name = "Neovim";
    exec = "kitty -e nvim %U";
    terminal = false;
    type = "Application";
    icon = "vim";
    categories = [
      "Utility"
      "TextEditor"
    ];
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
    onlyoffice-desktopeditors
    blanket
    xournalpp
    obsidian
    nautilus
    sushi
    adw-gtk3
    adwaita-icon-theme
    qt6Packages.qt6ct
    chromium
    ayugram-desktop
    spotifyd
    spicetify-cli
    mullvad
    qbittorrent
  ];

  home.stateVersion = "26.05";
}
