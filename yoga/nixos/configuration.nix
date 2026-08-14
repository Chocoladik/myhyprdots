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

  # Nix Settings & Binary Caches for CachyOS Kernel
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    substituters = [
      "https://cache.nixos.org"
      "https://nyx.chaotic.cx"
      "https://chaotic-nyx.cachix.org"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "chaotic-nyx.cachix.org-1:1tE88P3/y1Xo913l393B724xgt2aMyp/cW3CkW9/I24="
      "nyx.chaotic.cx-1:yIn/R19mOfI33A/81L6Kk4B7a12a52/241u762y="
      "hyprland.cachix.org-1:a7PGxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (final: prev: {
      zen-browser = inputs.zen-browser.packages.${prev.stdenv.hostPlatform.system}.default;
    })
  ];

  programs.fish.enable = true;

  fonts.packages = with pkgs; [
    jetbrains-mono
    googlesans-code
  ];

  system.stateVersion = "26.05";
}
