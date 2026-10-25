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
    loader.systemd-boot.configurationLimit = 3;
    loader.timeout = 0;
    loader.efi.canTouchEfiVariables = true;
    initrd.kernelModules = [ "i915" ];

    kernelPackages = pkgs.linuxPackages_cachyos;

    resumeDevice = "/dev/disk/by-uuid/b1c7a39a-2d0b-461e-b8c3-470a8d0075e7";

    kernelParams = [
      "quiet"
      "boot.shell_on_fail"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "vt.global_cursor_default=0"
      "usbcore.autosuspend=300"
    ];

    consoleLogLevel = 3;
    extraModprobeConfig = ''
      options hid_apple fnmode=1,
    '';
  };
}
