{ config, ... }: {
  xdg.configFile.wob = {
    text = ''
      anchor = top right
      background_color = ${config.colors.background}
      bar_color = ${config.colors.green}
      bar_padding = 0
      border_color = ${config.colors.green}
      border_size = 1
      height = 20
      margin = 10
    '';
    target = "wob/wob.ini";
  };
}
