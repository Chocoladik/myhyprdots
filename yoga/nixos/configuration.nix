{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/nixos/boot.nix
    ./modules/nixos/hardware.nix
    ./modules/nixos/networking.nix
    ./modules/nixos/security.nix
    ./modules/nixos/desktop.nix
    ./modules/nixos/services.nix
    ./modules/nixos/users.nix
  ];

  # Nix Settings
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    trusted-users = ["root" "@wheel"];

    substituters = [
      "https://cache.nixos.org"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7PGxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (final: prev: {
      zen-browser = inputs.zen-browser.packages.${prev.stdenv.hostPlatform.system}.default;
    })
  ]; 

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "26.05";
}
