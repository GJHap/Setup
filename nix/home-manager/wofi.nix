{ ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      location = "top_left";
      insensitive = true;
    };
  };
}
