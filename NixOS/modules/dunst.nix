{ pkgs, config, ... }: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        background = "#${config.colors.background}";
        foreground = "#${config.colors.foreground}";
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
        foreground = "#${config.colors.critical}";
        timeout = 0;
      };
    };
  };
}
