{ pkgs, lib, ... }:

let
  config = pkgs.writeText "kanshi-config" ''
    profile {
       output eDP-1 enable position 0,0
    }

    profile {
       output Virtual-1 enable mode 2560x1440
    }

    profile {
       output eDP-1 disable
       output DP-2 mode 2560x1440
    }
  '';

in {
  options = {
    kanshiConfig = lib.mkOption {
      type = lib.types.package;
      description = "Derivation for kanshi config";
      default = config;
    };
  };
}

