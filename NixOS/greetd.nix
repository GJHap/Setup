{ pkgs, config, ... }:

let
  swayConfig = pkgs.writeText "greetd-sway-config" ''
    exec kanshi --config ${config.kanshiConfig}
    exec swayidle -w \
       timeout 600 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
       timeout 1800 'systemctl suspend'

    exec "gtkgreet -l -s ${style} -c sway; swaymsg exit"

    bindsym Mod4+s exec wlogout -l ${wlogoutLayout}
  '';

  style = pkgs.writeText "greetd-style" ''
       window {
       background-size: cover;
       background-position: center;
       background-image: url("file://${config.wallpaper}")
    }
  '';

  wlogoutLayout = pkgs.writeText "greetd-wlogout-config" ''
    {
       "label" : "shutdown",
       "action" : "systemctl poweroff",
       "text" : "Shutdown",
       "keybind" : "s"
    }
    {
       "label" : "reboot",
       "action" : "systemctl reboot",
       "text" : "Reboot",
       "keybind" : "r"
    }
    {
       "label" : "suspend",
       "action" : "systemctl suspend",
       "text" : "Suspend",
       "keybind" : "u"
    }
  '';

in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = { command = "sway --config ${swayConfig}"; };
    };
  };

  environment.etc."greetd/environment".text = "sway";
}
