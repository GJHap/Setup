{ config, ... }: {
  xdg = {
    enable = true;
    configFile = {
      fish = {
        source =
          config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/fish;
      };
      lf = {
        source =
          config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/lf;
      };
      nvim = {
        source =
          config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/nvim;
      };
      starship = {
        source = config.lib.file.mkOutOfStoreSymlink
          /home/ghapgood/dev/Config/starship.toml;
        target = "starship.toml";
      };
      tmux = {
        source =
          config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/tmux;
      };
      wezterm = {
        source =
          config.lib.file.mkOutOfStoreSymlink /home/ghapgood/dev/Config/wezterm;
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
    mimeApps = {
      enable = true;
      defaultApplications = let
        nvim = "nvim.desktop";
        brave = "brave.desktop";
        thunderbird = "thunderbird.desktop";
      in {
        "text/calendar" = [ thunderbird ];
        "text/css" = [ nvim ];
        "text/csv" = [ nvim ];
        "text/html" = [ nvim ];
        "text/javascript" = [ nvim ];
        "text/plain" = [ nvim ];
        "text/vnd.trolltech.linguist" = [ nvim ];
        "application/json" = [ nvim ];
        "application/pdf" = [ brave ];
        "application/x-fishscript" = [ nvim ];
        "application/x-shellscript" = [ nvim ];
        "application/xml" = [ nvim ];
      };
    };
  };
}
