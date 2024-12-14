{ config, pkgs, ... }: {
  home = {
    packages = with pkgs; [ zsh ];
    file = {
      ".zshrc" = {
        source = config.lib.file.mkOutOfStoreSymlink
          /home/ghapgood/dev/Config/zsh/.zshrc;
      };
      zsh = {
        source =
          config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/zsh/zsh;
      };
    };
  };
}
