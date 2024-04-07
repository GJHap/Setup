{ config, ... }: {
  xdg.configFile.fish = {
    source = config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/fish;
  };
}
