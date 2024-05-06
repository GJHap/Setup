{
  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, home-manager, neovim-nightly-overlay, nixpkgs }:
    let
      overlays = [ neovim-nightly-overlay.overlay ];
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit overlays;
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        ghapgood = lib.nixosSystem {
          inherit system pkgs;
          modules = [
            ./NixOS/system/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.ghapgood = import ./NixOS/home-manager.nix;
              };
            }
          ];
        };
      };
    };
}
