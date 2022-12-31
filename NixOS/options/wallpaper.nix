{ pkgs, lib, ... }:

let
  wallpaper =
    "${pkgs.nixos-artwork.wallpapers.nineish-dark-gray}/share/backgrounds/nixos/nix-wallpaper-nineish-dark-gray.png";
in {
  options = {
    wallpaper = lib.mkOption {
      type = lib.types.str;
      description = "Wallpaper path";
      default = wallpaper;
    };
  };
}
