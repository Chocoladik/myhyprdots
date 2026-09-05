{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/";

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    scrolloverview = {
      url = "github:yayuuu/hyprland-scroll-overview";
      inputs.hyprland.follows = "hyprland";
    };

    hyprgrass = {
      url = "github:horriblename/hyprgrass";
      inputs.hyprland.follows = "hyprland";
    }; 

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, dms, ... }@inputs: {
    nixosConfigurations = {
      YOGA = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          /etc/nixos/configuration.nix
	        /etc/nixos/hardware-configuration.nix
	        dms.nixosModules.dank-material-shell
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.aktire = import ./home/home.nix;
	          home-manager.sharedModules = [
	            nix-flatpak.homeManagerModules.nix-flatpak
	          ];
          }
        ];
      };
    };
    homeConfigurations."aktire" = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    extraSpecialArgs = { inherit inputs; };
    modules = [
      ./home/home.nix
      nix-flatpak.homeManagerModules.nix-flatpak
    ];
  };
  };
}
