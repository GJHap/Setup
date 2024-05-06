{ config, pkgs, ... }: {
  home.packages = with pkgs; [ tmux ];
  xdg.configFile.tmux = {
    source = config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/tmux;
  };
}
