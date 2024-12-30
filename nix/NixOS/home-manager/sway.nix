{ pkgs, config, ... }:
let wob_sock = "$XDG_RUNTIME_DIR/wob.sock";
in {
  wayland.windowManager.sway = {
    config = rec {
      assigns = {
        "1" = [{ app_id = "org.wezfurlong.wezterm"; }];
        "2" = [
          { app_id = "firefox"; }
          { app_id = "chromium-browser"; }
          { app_id = "brave-browser"; }
        ];
        "3" = [{ app_id = "thunderbird"; }];
      };
      bars = [ ];
      colors = {
        focused = {
          background = "#285577";
          border = "#4c7899";
          childBorder = "#${config.colors.dracula.purple}";
          indicator = "#2e9ef4";
          text = "#ffffff";
        };
      };
      focus = { followMouse = "no"; };
      input = {
        "type:touchpad" = {
          accel_profile = "adaptive";
          click_method = "button_areas";
          dwt = "enabled";
          natural_scroll = "enabled";
          scroll_method = "two_finger";
          tap = "enabled";
        };
      };
      keybindings = {
        "${modifier}+1" = "exec ${terminal}";
        "${modifier}+2" = "exec brave";
        "${modifier}+3" = "exec thunderbird";
        "${modifier}+4" = "exec brave --new-window https://open.spotify.com";

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

        "XF86AudioRaiseVolume" = ''
          exec echo "$(pamixer -ui 5 && pamixer --get-volume volume) volume" > ${wob_sock}'';
        "XF86AudioLowerVolume" = ''
          exec echo "$(pamixer -ud 5 && pamixer --get-volume volume) volume" > ${wob_sock}'';
        "XF86AudioMute" = ''
          exec pamixer --toggle-mute && echo "$(pamixer --get-volume) $($(pamixer --get-mute) && echo "volume-mute" || echo "volume")" > ${wob_sock}'';
        "XF86AudioStop" = "exec playerctl --all-players stop";
        "XF86AudioPause" = "exec playerctl --all-players pause";
        "XF86AudioPlay" = "exec playerctl --all-players play-pause";
        "XF86AudioNext" = "exec playerctl --all-players next";
        "XF86AudioPrev" = "exec playerctl --all-players previous";
        "XF86AudioMicMute" = "exec pamixer --default-source -t";

        "XF86MonBrightnessUp" = ''
          exec printf "%.0f brightness\n" $(brillo -q -A 5 && brillo -q) > ${wob_sock}'';
        "XF86MonBrightnessDown" = ''
          exec printf "%.0f brightness\n" $(brillo -q -U 5 && brillo -q) > ${wob_sock}'';

        "Print" = "exec grim";
        "${modifier}+Print" = ''exec grim -g "$(slurp)" - | swappy -f -'';

        "${modifier}+s" = "exec ${config.wofiLogout}";
        "${modifier}+w" = "kill";
        "${modifier}+v" = "exec clipman pick -t wofi";
        "${modifier}+r" = "reload";
        "${modifier}+f" = "fullscreen";
        "${modifier}+g" = "floating toggle";
        "${modifier}+t" = "layout tabbed";
        "${modifier}+Shift+c" = "splith";
        "${modifier}+Shift+r" = "splitv";
      };
      modifier = "Mod4";
      menu = "wofi --show drun -O alphabetical";
      output = {
        "*" = {
          bg =
            "${pkgs.nixos-artwork.wallpapers.nineish-dark-gray}/share/backgrounds/nixos/nix-wallpaper-nineish-dark-gray.png fill";
        };
      };
      seat = { seat0 = { xcursor_theme = "capitaine-cursors 25"; }; };
      startup = [
        {
          always = true;
          command = "${config.swayDisplayReloadFix}";
        }
        {
          always = true;
          command = ''
            export XDG_DATA_DIRS=${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:$XDG_DATA_DIRS && \
            gnome_schema=org.gnome.desktop.interface && \
            gsettings set $gnome_schema gtk-theme 'Dracula' && \
            gsettings set $gnome_schema cursor-theme 'capitaine-cursors'
          '';
        }
      ];
      terminal = "wezterm";
      window = {
        border = 1;
        commands = [{
          command = "move window to workspace 4";
          criteria = { title = "^Spotify"; };
        }];
        hideEdgeBorders = "smart";
      };
    };
    enable = true;
    extraConfig = ''
      bindswitch --reload --locked lid:on output eDP-1 disable
      bindswitch --reload --locked lid:off output eDP-1 enable
    '';
    extraSessionCommands = ''
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND="1"
      export NIXOS_OZONE_WL="1"
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export WLR_RENDERER=vulkan,gles2,pixman
      export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/keyring/ssh
      export XDG_CURRENT_DESKTOP=sway
    '';
    systemd.enable = true;
    wrapperFeatures.gtk = true;
  };
}
