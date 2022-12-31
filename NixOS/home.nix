{ pkgs, lib, config, ... }:
let
  background = "282A36";
  foreground = "F8F8F2";
  green = "50FA7B";
  critical = "FF5555";
  sway-module = "374151";
  sway-hover = "4B5563";
in {
  imports = [ ./wallpaper.nix ./swayDisplayReloadFix.nix ];

  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        background = "#${background}";
        foreground = "#${foreground}";
        separator_color = "foreground";
        timeout = 5;

        frame_width = 0;
        width = "(350, 400)";
        height = 100;
        corner_radius = 10;

        font = "JetBrainsMono Nerd Font";
        markup = "full";

        icon_path =
          "${pkgs.gnome.adwaita-icon-theme}/share/icons/Adwaita/16x16/status/:${pkgs.gnome.adwaita-icon-theme}/share/icons/Adwaita/16x16/devices/:${pkgs.gnome.adwaita-icon-theme}/share/icons/Adwaita/16x16/legacy/";

        dmenu = "wofi -d -p dunst";
        browser = "firefox";
      };

      urgency_critical = {
        foreground = "#${critical}";
        timeout = 0;
      };
    };
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        spacing = 10;
        modules-left = [ "sway/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "network" "pulseaudio" "battery" ];

        "sway/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "爵";
            "3" = "";
            "4" = "";
          };
          persistent_workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
          };
        };

        "network" = {
          "format-wifi" = "";
          "format-ethernet" = "";
          "tooltip-format" = "{essid}";
          "format-disconnected" = "⚠";
        };

        "battery" = {
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon}";
          "format-charging" = "ﮣ";
          "format-plugged" = "ﮣ";
          "format-icons" = [ "" "" "" "" "" "" "" "" "" "" ];
          "tooltip-format" = "{capacity}% remaining";
        };

        "pulseaudio" = {
          "format" = "{icon} {format_source}";
          "format-muted" = "  {format_source}";
          "format-bluetooth" = "{icon}  {format_source}";
          "format-bluetooth-muted" = "  {icon}  {format_source}";
          "format-source" = "";
          "format-source-muted" = "";
          "format-icons" = { "default" = [ " " " " " " ]; };
          "tooltip-format" = "{desc}: {volume}%";
          "on-click" = "pavucontrol";
        };

        "clock" = {
          "format" = "{:%d %b %I:%M}";
          "tooltip-format" = ''
            <span size='large'>{:%Y %B}</span>

            {calendar}'';
          "today-format" = "<span weight='bold' color='#${green}'>{}</span>";
          "format-calendar" = "<span weight='bold' color='#ecc6d9'>{}</span>";
          "on-scroll" = { "calendar" = 1; };
        };
      };
    };

    style = ''
      * {
         font-family: 'JetBrainsMono Nerd Font';
      }

      #waybar {
         background: #${background};
         border-radius: 10px;
      }

      .modules-left,
      .modules-right {
         border-radius: 10px;
         background: alpha(#${sway-module}, 0.7);
      }

      #workspaces button {
         padding: 0 5px;
      }

      #workspaces button:hover {
         background: alpha(#${sway-hover}, 0.6);
      }

      #workspaces button.focused {
         color: #${green};
      }

      #workspaces button.urgent,
      #network.disconnected {
         color: #${critical};
      }

      #workspaces button,
      #clock,
      #battery,
      #network,
      #pulseaudio {
         background: transparent;
         border-radius: 10px;
         color: #${foreground};
      }

      #clock,
      #battery,
      #network,
      #pulseaudio {
         padding: 0 10px;
      }

      #battery.charging {
         color: #${green};
      }

      @keyframes battery-critical {
         to {
            color: #${critical};
         }
      }

      #battery.critical:not(.charging) {
         animation: battery-critical 1.5s linear 0s infinite alternate;
      }
    '';
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "capitaine-cursors";
      size = 25;
    };
    theme = { name = "Dracula"; };
  };

  wayland.windowManager.sway = let
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
        commands = [{
          command = "move window to workspace 4";
          criteria = { title = "^Spotify"; };
        }];
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
            timeout 600 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
            timeout 1200 'swaylock -f -c 000000' \
            timeout 1800 'loginctl terminate-user $USER' \
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

  xdg = {
    enable = true;
    configFile = {
      fish = {
        source =
          config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/fish;
      };
      wezterm = {
        source =
          config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/wezterm;
      };
      starship = {
        source = config.lib.file.mkOutOfStoreSymlink
          /home/ghapgood/dev/Config/starship.toml;
        target = "starship.toml";
      };
      nvim = {
        source =
          config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/nvim;
      };
      wob = {
        text = ''
          bar_color = ${green}
          background_color = ${background}
          border_color = ${green}
          height = 20
          border_size = 1
          bar_padding = 0
          margin = 10
          anchor = top right
        '';
        target = "wob/wob.ini";
      };
    };
  };

  home.stateVersion = "22.05";
}
