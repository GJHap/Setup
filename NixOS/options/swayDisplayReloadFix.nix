{ pkgs, lib, ... }:

let
  config = pkgs.writeScript "swayDisplayReloadFix.sh" ''
    #! ${pkgs.stdenv.shell}

    LAPTOP_OUTPUT="eDP-1"
    LID_STATE_FILE="/proc/acpi/button/lid/LID0/state"

    read -r LS < "$LID_STATE_FILE"

    case "$LS" in
    *open)   swaymsg output "$LAPTOP_OUTPUT" enable ;;
    *closed) swaymsg output "$LAPTOP_OUTPUT" disable ;;
    *)       echo "Could not get lid state" >&2 ; exit 1 ;;
    esac
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
