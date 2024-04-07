{ config, ... }: {
  xdg.configFile.wezterm = {
    source =
      config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/wezterm;
  };
}
