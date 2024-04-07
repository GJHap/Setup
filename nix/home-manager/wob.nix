{ config, ... }: {
  xdg.configFile.wob = {
    text = ''
      bar_color = ${config.colors.green}
      background_color = ${config.colors.background}
      border_color = ${config.colors.green}
      height = 20
      border_size = 1
      bar_padding = 0
      margin = 10
      anchor = top right
    '';
    target = "wob/wob.ini";
  };
}
