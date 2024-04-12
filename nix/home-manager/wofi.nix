{ ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      insensitive = true;
      location = "top_left";
    };
  };
}
