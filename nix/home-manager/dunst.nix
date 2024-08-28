{ pkgs, config, ... }: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        background = "#${config.colors.dracula.background}";
        browser = "brave";
        corner_radius = 10;
        dmenu = "wofi -d -p dunst";
        font = "JetBrainsMono Nerd Font";
        foreground = "#${config.colors.dracula.foreground}";
        frame_width = 0;
        height = 100;
        icon_path =
          "${pkgs.adwaita-icon-theme}/share/icons/Adwaita/16x16/status/:${pkgs.adwaita-icon-theme}/share/icons/Adwaita/16x16/devices/:${pkgs.adwaita-icon-theme}/share/icons/Adwaita/16x16/legacy/";
        markup = "full";
        monitor = 0;
        separator_color = "foreground";
        timeout = 5;
        width = "(350, 400)";
      };
      urgency_critical = {
        foreground = "#${config.colors.dracula.red}";
        timeout = 0;
      };
    };
  };
}
