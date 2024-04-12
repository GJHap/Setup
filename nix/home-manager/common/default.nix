{ pkgs, lib, config, ... }: {
  imports =
    [ ./fish.nix ./lf.nix ./nvim.nix ./packages.nix ./starship.nix ./tmux.nix ];
  home.stateVersion = "22.05";
  xdg.enable = true;
}
