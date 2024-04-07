{ config, ... }: {
  xdg.configFile.nvim = {
    source = config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/nvim;
  };
}
