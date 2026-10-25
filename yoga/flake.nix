{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprgrass = {
      url = "github:horriblename/hyprgrass";
      inputs.hyprland.follows = "hyprland";
    };

    scrolloverview = {
      url = "github:yayuuu/hyprland-scroll-overview/new-release";
      inputs.hyprland.follows = "hyprland";
    };

    dms = {
      url = "github:duxlabs-dev/dux-shell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    /*
      dcal = {
        url = "github:duxlabs-dev/dux-calendar";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    */

    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      chaotic,
      nix-flatpak,
      home-manager,
      hyprland,
      hyprgrass,
      scrolloverview,
      dms,
      #dcal,
      dms-plugin-registry,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        YOGA = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./configuration.nix
            ./hardware-configuration.nix
            home-manager.nixosModules.home-manager
            chaotic.nixosModules.default
            dms.nixosModules.dank-material-shell
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.aktire = import ./home/home.nix;
              home-manager.sharedModules = [
                nix-flatpak.homeManagerModules.nix-flatpak
                #dfiles.homeModules.dux-files
              ];
            }
          ];
        };
      };
    };
}
