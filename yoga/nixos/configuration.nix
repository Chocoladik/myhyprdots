{ config, lib, pkgs, inputs, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    #(import "${home-manager}/nixos")
  ];

  # Boot & Kernel
  boot = {
    plymouth = {
      enable = true;
      theme = "lone";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override { selected_themes = [ "lone" ]; })
        ];
      };

    loader.systemd-boot.enable = true;
    loader.timeout = 0;
    loader.efi.canTouchEfiVariables = true;
    
    initrd.systemd.enable = true;
    initrd.verbose = false;
    initrd.kernelModules = ["i915"];

    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "vt.global_cursor_default=0"
    ];

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
  };

  # Display Manager & Hyprland
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.withUWSM  = true;
  /*wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
       inputs.hyprcapture.packages.${pkgs.system}.default
       inputs.hyprgrass.packages.${pkgs.system}.default
       inputs.hyprscroll.packages.${pkgs.system}.default
    ];
  };*/
  
  qt.enable = true;
  qt.platformTheme = "gnome";
  qt.style = "adwaita-dark";
 
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];
    config = {
      hyprland = {
        default = [ "hyprland" "gtk" ];
      };
      common = {
        default = [ "hyprland" "gtk" ];
      };
    };
  };

  programs.fuse.userAllowOther = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GTK_CSD = "0";
    QT_QPA_PLATFORM = "wayland";
    XDG_SCREENSHOT_BACKEND = "hyprland";
  };

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

  # System packages 
  environment.systemPackages = with pkgs; [
    git
    gh
    neovim
    tuigreet
    xdg-user-dirs
    fetch
    pulseaudio
    wayland-pipewire-idle-inhibit
    glib
    gsettings-desktop-schemas
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    googlesans-code
  ];

  # State Version 
  system.stateVersion = "26.05";
}
