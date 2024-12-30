{
  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, home-manager, neovim-nightly-overlay, nix-darwin, nixpkgs }:
    let
      buildSystem = { basePath, systemFn, system, hmFn }:
        systemFn {
          inherit system;
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ neovim-nightly-overlay.overlays.default ];
            config.allowUnfree = true;
          };
          modules = [
            "${self}/${basePath}/system/configuration.nix"
            hmFn
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.ghapgood = import "${self}/${basePath}/home-manager";
              };
            }
          ];
        };
    in {
      darwinConfigurations = {
        darwin = buildSystem {
          basePath = "Darwin";
          systemFn = nix-darwin.lib.darwinSystem;
          system = "x86_64-darwin";
          hmFn = home-manager.darwinModules.home-manager;
        };
      };
      nixosConfigurations = {
        nixos = buildSystem {
          basePath = "NixOS";
          systemFn = nixpkgs.lib.nixosSystem;
          system = "x86_64-linux";
          hmFn = home-manager.nixosModules.home-manager;
        };
      };
    };
}
