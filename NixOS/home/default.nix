{ pkgs, lib, config, ... }: {
  imports = [
    ../options/swayDisplayReloadFix.nix
    ../options/wofi-logout.nix
    ../options/colors.nix
    ../modules
  ];

  home.stateVersion = "22.05";
}
