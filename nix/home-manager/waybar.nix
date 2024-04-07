{ config, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        spacing = 10;
        modules-left = [ "sway/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "network" "pulseaudio" "battery" ];

        "sway/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "󰽴";
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
          "format-ethernet" = "󰈁";
          "tooltip-format" = "{essid}";
          "format-disconnected" = "";
        };

        "battery" = {
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon}";
          "format-charging" = "";
          "format-plugged" = "";
          "format-icons" = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          "tooltip-format" = "{capacity}% remaining";
        };

        "pulseaudio" = {
          "format" = "{icon} {format_source}";
          "format-muted" = "󰖁 {format_source}";
          "format-bluetooth" = "{icon} 󰂱 {format_source}";
          "format-bluetooth-muted" = "{icon} 󰂲 {format_source}";
          "format-source" = "󰍬";
          "format-source-muted" = "󰍭";
          "format-icons" = { "default" = [ "󰕿" "󰖀" "󰕾" ]; };
          "tooltip-format" = "{desc}: {volume}%";
          "on-click" = "pavucontrol";
        };

        "clock" = {
          "format" = "{:%d %b %I:%M}";
          "tooltip-format" = ''
            <span size='large'>{:%Y %B}</span>

            {calendar}'';
          "today-format" =
            "<span weight='bold' color='#${config.colors.green}'>{}</span>";
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
         background: #${config.colors.background};
         border-radius: 10px;
      }

      .modules-left,
      .modules-right {
         border-radius: 10px;
         background: alpha(#${config.colors.sway-module}, 0.7);
      }

      #workspaces button {
         padding: 0 5px;
      }

      #workspaces button:hover {
         background: alpha(#${config.colors.sway-hover}, 0.6);
      }

      #workspaces button.focused {
         color: #${config.colors.green};
      }

      #workspaces button.urgent,
      #network.disconnected {
         color: #${config.colors.red};
      }

      #workspaces button,
      #clock,
      #battery,
      #network,
      #pulseaudio {
         background: transparent;
         border-radius: 10px;
         color: #${config.colors.foreground};
      }

      #clock,
      #battery,
      #network,
      #pulseaudio {
         padding: 0 10px;
      }

      #battery.charging {
         color: #${config.colors.green};
      }

      @keyframes battery-critical {
         to {
            color: #${config.colors.red};
         }
      }

      #battery.critical:not(.charging) {
         animation: battery-critical 1.5s linear 0s infinite alternate;
      }
    '';
  };
}
