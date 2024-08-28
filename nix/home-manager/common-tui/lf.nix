{ config, pkgs, ... }: {
  home.packages = with pkgs; [ lf ];
  xdg.configFile.lf = {
    source = config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/lf;
  };
}
