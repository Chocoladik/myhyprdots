{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprcapture = {
      url = "github:gfhdhytghd/HyprCapture";
      inputs.hyprland.follows = "hyprland";
    };
    scrolloverview = {
      url = "github:yayuuu/hyprland-scroll-overview";
      inputs.hyprland.follows = "hyprland";
    };
    hyprgrass = {
         url = "github:horriblename/hyprgrass";
         inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = { self, nixpkgs, dms, zen-browser, hyprcapture, ... }@inputs: {
    nixosConfigurations = {
      YOGA = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          dms.nixosModules.default
          ./configuration.nix
        ];
      };
    };
  };
}
