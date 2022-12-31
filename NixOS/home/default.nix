{ pkgs, lib, config, ... }: {
  imports = [
    ../options/wallpaper.nix
    ../options/swayDisplayReloadFix.nix
    ../options/colors.nix
    ../modules
  ];

  home.stateVersion = "22.05";
}
