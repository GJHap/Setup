{ pkgs, ... }: {
  nix = {
    extraOptions = "experimental-features = nix-command flakes";
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixStable;
    settings = {
      auto-optimise-store = true;
      allowed-users = [ "ghapgood" ];
    };
  };
}
