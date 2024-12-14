{ config, lib, pkgs, ... }: {
  imports =
    [ ./fish.nix ./lf.nix ./nvim.nix ./packages.nix ./tmux.nix ./zsh.nix ];
  home.stateVersion = "22.05";
  xdg.enable = true;
}
