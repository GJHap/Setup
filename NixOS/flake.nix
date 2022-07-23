{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, neovim-nightly-overlay, home-manager }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ neovim-nightly-overlay.overlay ];
      };
      lib = nixpkgs.lib;

    in {
      nixosConfigurations = {
        ghapgood = lib.nixosSystem {
          inherit system pkgs;
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ghapgood = { imports = [ ./home.nix ]; };
            }
          ];
        };
      };
    };
}
