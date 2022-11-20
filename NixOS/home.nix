{ pkgs, lib, config, ... }: {
  imports = [ ./wallpaper.nix ./swayDisplayReloadFix.nix ];

  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        foreground = "#AAAAAADD";
        highlight = "#AAAAAADD";
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
        background = "#900000";
        foreground = "#ffffff";
        frame_color = "#ff0000";
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
        modules-center = [ ];
        modules-right =
          [ "cpu" "memory" "disk" "network" "battery" "pulseaudio" "clock" ];

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

        "cpu" = { "format" = ""; };

        "memory" = {
          "format" = "";
          "tooltip-format" = ''
            {percentage}% used
            {used:0.2f}GiB/{total:0.1f}GiB'';
        };
        "disk" = {
          "format" = "﫭";
          "tooltip-format" = ''
            {percentage_used}% used
            {used}/{total}'';
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
          "format-charging" = "";
          "format-plugged" = "";
          "format-icons" = [ "" "" "" "" "" "" "" "" "" "" ];
          "tooltip-format" = "{capacity}% remaining";
        };
        "pulseaudio" = {
          "format" = "{icon}  {format_source}";
          "format-muted" = "  {format_source}";
          "format-bluetooth" = "{icon}    {format_source}";
          "format-bluetooth-muted" = "  {icon}    {format_source}";
          "format-source" = "";
          "format-source-muted" = "";
          "format-icons" = { "default" = [ "" "" "" ]; };
          "tooltip-format" = "{desc}: {volume}%";
          "on-click" = "pavucontrol";
        };
        "clock" = { "format" = "{:%m/%d/%g %I:%M %p}"; };
      };
    };

    style = ''
      * {
         font-family: 'JetBrainsMono Nerd Font';
      }

      #waybar {
         background: @theme_base_color;
         color: @theme_text_color;
         transition-property: background-color;
         transition-duration: .5s;
      }

      #workspaces button {
         padding: 0 5px;
         background-color: transparent;
         color: @theme_text_color;
         box-shadow: inset 0 -3px transparent;
         border: none;
         border-radius: 0;
      }

      #workspaces button:hover {
         background: rgba(0, 0, 0, 0.2);
         box-shadow: inset 0 -3px @theme_text_color;
      }

      #workspaces button.focused {
         background-color: #64727D;
         box-shadow: inset 0 -3px @theme_text_color;
      }

      #workspaces button.urgent {
         background-color: #eb4d4b;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #network,
      #pulseaudio {
         padding: 0 10px;
         color: @theme_text_color;
      }

      #workspaces {
         margin: 0 4px;
      }

      .modules-left > widget:first-child > #workspaces {
         margin-left: 0;
      }

      .modules-right > widget:last-child > #workspaces {
         margin-right: 0;
      }

      #battery.charging, #battery.plugged {
         background-color: #26A65B;
      }

      @keyframes blink {
         to {
            background-color: @theme_text_color;
            color: #000000;
         }
      }

      #battery.critical:not(.charging) {
         background-color: #f53c3c;
         color: @theme_text_color;
         animation-name: blink;
         animation-duration: 0.5s;
         animation-timing-function: linear;
         animation-iteration-count: infinite;
         animation-direction: alternate;
      }

      label:focus {
         background-color: #000000;
      }

      #network.disconnected {
         background-color: #f53c3c;
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
            wl-paste -p -t text --watch clipman store -P --histpath="~/.local/share/clipman-primary.json"'';
        }
        {
          command = "${config.swayDisplayReloadFix}";
          always = true;
        }
        {
          command = ''
            dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway && \
            systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr && \
            systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
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
            wob -a "top" -a "right" --bar-color "#16a34aFF" --background-color "#3F3F30FF" -H 20 -b 1 --border-color "#86efacFF" -p 0 -M 10
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
        "${modifier}+Print" = "exec slurp | grim -g -";

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
    };
  };

  home.stateVersion = "22.05";
}
