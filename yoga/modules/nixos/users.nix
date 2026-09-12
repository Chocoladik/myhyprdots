{ pkgs, ... }:

{
  users.users.aktire = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "render" "input" ];
  };
}
