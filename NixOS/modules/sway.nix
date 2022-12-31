{ pkgs, config, ... }:
let
  wob_sock = "$XDG_RUNTIME_DIR/wob_volume.sock";
  wlogoutLayout = pkgs.writeText "wlogout-config" ''
    {
       "label" : "lock",
       "action" : "swaylock -f -c 000000",
       "text" : "Lock",
       "keybind" : "l"
    }
    {
       "label" : "hibernate",
       "action" : "systemctl hibernate",
       "text" : "Hibernate",
       "keybind" : "h"
    }
    {
       "label" : "logout",
       "action" : "loginctl terminate-user $USER",
       "text" : "Logout",
       "keybind" : "e"
    }
    {
       "label" : "shutdown",
       "action" : "systemctl poweroff",
       "text" : "Shutdown",
       "keybind" : "s"
    }
    {
       "label" : "suspend",
       "action" : "systemctl suspend",
       "text" : "Suspend",
       "keybind" : "u"
    }
    {
       "label" : "reboot",
       "action" : "systemctl reboot",
       "text" : "Reboot",
       "keybind" : "r"
    }
  '';
in {
  wayland.windowManager.sway = {
    enable = true;
    extraConfig = ''
      bindswitch --reload --locked lid:on output eDP-1 disable
      bindswitch --reload --locked lid:off output eDP-1 enable
    '';

    config = rec {
      modifier = "Mod4";
      menu = "wofi --show drun -O alphabetical -l 1";
      terminal = "wezterm";
      focus = { followMouse = "no"; };
      assigns = {
        "1" = [{ app_id = "org.wezfurlong.wezterm"; }];
        "2" = [{ app_id = "firefox"; }];
        "3" = [{ app_id = "thunderbird"; }];
      };
      seat = { seat0 = { xcursor_theme = "capitaine-cursors 25"; }; };
      window = {
        border = 1;
        hideEdgeBorders = "smart";
        commands = [{
          command = "move window to workspace 4";
          criteria = { title = "^Spotify"; };
        }];
      };
      colors = {
        focused = {
          background = "#285577";
          border = "#4c7899";
          childBorder = "#${config.colors.purple}";
          indicator = "#2e9ef4";
          text = "#ffffff";
        };
      };
      bars = [{ command = "waybar"; }];
      startup = [
        { command = "wl-paste -t text --watch clipman store"; }
        {
          command = ''
            wl-paste -p -t text --watch clipman store -P --histpath="~/.local/share/clipman-primary.json"
          '';
        }
        {
          command = "${config.swayDisplayReloadFix}";
          always = true;
        }
        {
          command = ''
            systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK
          '';
          always = true;
        }
        {
          command = ''
            export XDG_DATA_DIRS=${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:$XDG_DATA_DIRS && \
            gnome_schema=org.gnome.desktop.interface && \
            gsettings set $gnome_schema gtk-theme 'Dracula' && \
            gsettings set $gnome_schema cursor-theme 'capitaine-cursors'
          '';
          always = true;
        }
        {
          command = ''
            rm -f ${wob_sock} && \
            mkfifo ${wob_sock} && \
            tail -f ${wob_sock} | \
            wob
          '';
          always = true;
        }
        {
          command = ''
            swayidle -w \
            timeout 300 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
            timeout 360 'swaylock -f -c 000000' \
            before-sleep 'swaylock -f -c 000000'
          '';
        }
        { command = "sway-audio-idle-inhibit"; }
      ];
      keybindings = {
        "${modifier}+1" = "exec ${terminal}";
        "${modifier}+2" = "exec firefox";
        "${modifier}+3" = "exec thunderbird";
        "${modifier}+4" = "exec firefox --new-window https://open.spotify.com";

        "${modifier}+d" = "exec ${menu}";

        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";

        "${modifier}+Shift+h" = "move left 50px";
        "${modifier}+Shift+j" = "move down 50px";
        "${modifier}+Shift+k" = "move up 50px";
        "${modifier}+Shift+l" = "move right 50px";
        "${modifier}+Shift+0" = "move position center";

        "${modifier}+minus" = "resize shrink height 50px";
        "${modifier}+equal" = "resize grow height 50px";
        "${modifier}+comma" = "resize shrink width 50px";
        "${modifier}+period" = "resize grow width 50px";
        "${modifier}+0" = "resize set width 100ppt height 100ppt";

        "${modifier}+control+1" = "workspace number 1";
        "${modifier}+control+2" = "workspace number 2";
        "${modifier}+control+3" = "workspace number 3";
        "${modifier}+control+4" = "workspace number 4";
        "${modifier}+control+5" = "workspace number 5";

        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";

        "XF86AudioRaiseVolume" =
          "exec pamixer -ui 5 && pamixer --get-volume > ${wob_sock}";
        "XF86AudioLowerVolume" =
          "exec pamixer -ud 5 && pamixer --get-volume > ${wob_sock}";
        "XF86AudioMute" =
          "exec pamixer --toggle-mute && ($(pamixer --get-mute) == true && echo 0 > ${wob_sock}) || pamixer --get-volume > ${wob_sock}";
        "XF86AudioStop" = "exec playerctl --all-players stop";
        "XF86AudioPause" = "exec playerctl --all-players pause";
        "XF86AudioPlay" = "exec playerctl --all-players play-pause";
        "XF86AudioNext" = "exec playerctl --all-players next";
        "XF86AudioPrev" = "exec playerctl --all-players previous";
        "XF86AudioMicMute" = "exec pamixer --default-source -t";

        "XF86MonBrightnessUp" = "exec brillo -q -A 5";
        "XF86MonBrightnessDown" = "exec brillo -q -U 5";

        "Print" = "exec grim";
        "${modifier}+Print" = ''exec grim -g "$(slurp)" - | swappy -f -'';

        "${modifier}+s" = "exec wlogout -l ${wlogoutLayout}";
        "${modifier}+w" = "kill";
        "${modifier}+v" = "exec clipman pick -t wofi -T'-l 1'";
        "${modifier}+r" = "reload";
        "${modifier}+f" = "fullscreen";
        "${modifier}+g" = "floating toggle";
        "${modifier}+t" = "layout tabbed";
        "${modifier}+Shift+c" = "splith";
        "${modifier}+Shift+r" = "splitv";
      };
      input = {
        "type:touchpad" = {
          natural_scroll = "enabled";
          tap = "enabled";
          accel_profile = "adaptive";
          dwt = "enabled";
          scroll_method = "two_finger";
          click_method = "button_areas";
        };
      };
      output = { "*" = { bg = "${config.wallpaper} fill"; }; };
    };
  };
}
