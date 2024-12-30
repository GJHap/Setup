{ config, ... }: {
  services.wob = {
    enable = true;
    settings = {
      "" = {
        anchor = "center left";
        background_color = "${config.colors.dracula.background}";
        bar_padding = 0;
        border_size = 2;
        height = 350;
        margin = 20;
        orientation = "vertical";
        width = 22;
      };
      "style.volume" = {
        bar_color = "${config.colors.dracula.green}";
        border_color = "${config.colors.dracula.green}";
      };
      "style.volume-mute" = {
        bar_color = "${config.colors.dracula.green}";
        border_color = "${config.colors.dracula.red}";
      };
      "style.brightness" = {
        bar_color = "${config.colors.dracula.orange}";
        border_color = "${config.colors.dracula.orange}";
      };
    };
    systemd = true;
  };
}
