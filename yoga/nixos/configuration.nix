{ config, lib, pkgs, inputs, ... }: {

  imports = [
    ./hardware-configuration.nix
  ];

  # Boot & Kernel
  boot = {
    plymouth = {
      enable = true;
      theme = "lone";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "lone" ];
        })
      ];
    };
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];

    loader.timeout = 0;
    initrd.verbose = false;
    consoleLogLevel = 3;
  };

  # Connection & Time
  networking.hostName = "YOGA";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 57621 ];
  networking.firewall.allowedUDPPorts = [ 5353 ];
  time.timeZone = "Europe/Berlin";

  hardware.bluetooth = {
  enable = true;
  powerOnBoot = false;
  settings = {
    General = {
      Experimental = true;
      FastConnectable = true;
    };
    Policy = {
      AutoEnable = true;
      };
    };
  };

  # Nix Settings & Overlays
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  
  nixpkgs.overlays = [
    (final: prev: {
      zen-browser = inputs.zen-browser.packages.${prev.stdenv.hostPlatform.system}.default;
    })
  ];
  
  hardware.cpu.intel.updateMicrocode = true;

  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  };
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-vaapi-driver
      libvdpau-va-gl
    ];
  };

  # User & Shell
  programs.fish.enable = true;

  users.users.aktire = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "render" "input" ]; 
    shell = pkgs.fish;
    packages = with pkgs; [
      tree
      kitty
      wvkbd
      android-tools
      flameshot
      hyprshot
      btop
      vscodium
      mpv
      loupe
      papers
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
  };

  # Display Manager & Hyprland
  programs.hyprland.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd start-hyprland";
        user = "greeter";
      };
    };
  };

  # DankMaterialShell
  programs.dms-shell = {
    enable = true;
    package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;
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

  # System Services
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

  # Environment & Theming
  qt.enable = true;
  qt.platformTheme = "gnome";
  qt.style = "adwaita-dark";
 
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GTK_CSD = "1";
  };

  environment.systemPackages = with pkgs; [
    git
    gh
    neovim
    jetbrains-mono
    googlesans-code
    tuigreet
    xdg-user-dirs
    fetch
    wayland-pipewire-idle-inhibit
    glib
    gsettings-desktop-schemas
  ];

  # State Version 
  system.stateVersion = "26.05";
}
