{ pkgs, lib, config, ... }: {
  imports =
    [ ./fish.nix ./lf.nix ./nvim.nix ./packages.nix ./starship.nix ./tmux.nix ];

  xdg.enable = true;

  home.stateVersion = "22.05";
}
