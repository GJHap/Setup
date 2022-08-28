{ pkgs, lib, ... }:

let
  config = pkgs.writeText "swayDisplayReloadFix.sh" ''
    #!/usr/bin/bash
    if grep -q open /proc/acpi/button/lid/LID/state; then
       swaymsg output eDP-1 enable
    else
       swaymsg output eDP-1 disable
    fi
  '';
in {
  options = {
    swayDisplayReloadFix = lib.mkOption {
      type = lib.types.package;
      description =
        "Script to prevent Sway from enabling all displays on reload";
      default = config;
    };
  };
}
