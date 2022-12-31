{ config, ... }: {
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
    };
  };
}
