{ pkgs, ... }: {
  imports = [ ../shared/home-manager/gui ../shared/home-manager/tui ]
    ++ (if builtins.pathExists ./extras.nix then [ ./extras.nix ] else [ ]);
}
