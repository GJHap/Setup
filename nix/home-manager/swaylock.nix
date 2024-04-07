{ ... }: {
  programs.swaylock = {
    enable = true;
    settings = {
      color = "000000";
      daemonize = true;
    };
  };
}
