{ config, ... }: {
  xdg.configFile.starship = {
    source = config.lib.file.mkOutOfStoreSymlink
      /home/ghapgood/dev/Config/starship.toml;
    target = "starship.toml";
  };
}
