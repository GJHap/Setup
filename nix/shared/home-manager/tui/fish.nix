{ config, pkgs, ... }: {
  home.packages = with pkgs; [ fish ];
  xdg.configFile.fish = {
    source = config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/fish;
  };
}
