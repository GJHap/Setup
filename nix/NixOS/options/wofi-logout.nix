{ pkgs, lib, ... }:
let
  config = pkgs.writeScript "wofi-logout.sh" ''
    #! ${pkgs.stdenv.shell}

    choicesArr=(Hibernate Lock Logout Reboot Shutdown Suspend)
    choices=$(printf '%s\n' "''${choicesArr[@]}")
    choice=$(echo "$choices" | wofi --show dmenu -p "")

    if [ "$choice" = Hibernate ]; then
       systemctl hibernate
    elif [ "$choice" = Lock ]; then
       swaylock
    elif [ "$choice" = Logout ]; then
       loginctl terminate-user $USER
    elif [ "$choice" = Reboot ]; then
       systemctl reboot
    elif [ "$choice" = Shutdown ]; then
       systemctl poweroff
    elif [ "$choice" = Suspend ]; then
       systemctl suspend
    fi
  '';
in {
  options = {
    wofiLogout = lib.mkOption {
      type = lib.types.package;
      description = "Script to display a logout screen using wofi";
      default = config;
    };
  };
}
