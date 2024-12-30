{ config, pkgs, ... }: {
  home.packages = with pkgs; [ wezterm ];
  xdg.configFile.wezterm = {
    source =
      config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/wezterm;
  };
}
