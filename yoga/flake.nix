{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/";
 
  home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };

    
   hyprland = {
     url = "github:hyprwm/Hyprland";
     inputs.nixpkgs.follows = "nixpkgs";
   };

   dms = {
     url = "github:AvengeMedia/DankMaterialShell/stable";
     inputs.nixpkgs.follows = "nixpkgs";
   };

   dms-plugin-registry = {
     url = "github:AvengeMedia/dms-plugin-registry";
     inputs.nixpkgs.follows = "nixpkgs";
   };

   zen-browser = {
     url = "github:youwen5/zen-browser-flake";
   };

   areofyl-fetch.url = "github:areofyl/fetch";

 };

  outputs = { self, nixpkgs, chaotic, nix-flatpak, home-manager, hyprland, dms, dms-plugin-registry, zen-browser, ... }@inputs: {
    nixosConfigurations = {
      YOGA = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
	  ./hardware-configuration.nix
	  dms.nixosModules.dank-material-shell
          home-manager.nixosModules.home-manager
	  chaotic.nixosModules.default
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
  };
}
