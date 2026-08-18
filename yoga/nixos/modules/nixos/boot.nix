{ pkgs, ... }:

{
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
    initrd.kernelModules = [ "i915" ];

    kernelPackages = pkgs.linuxPackages_zen;

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
}
