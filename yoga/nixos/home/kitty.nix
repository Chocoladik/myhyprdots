{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      font_family = "JetBrains mono";
      font_size = "12.0";
      confirm_os_window_close = 0;
    };

    extraConfig = ''
      include dank-tabs.conf
      include dank-theme.conf
    '';
  };
}
