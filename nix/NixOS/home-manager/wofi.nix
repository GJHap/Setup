{ ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      insensitive = true;
      layer = "overlay";
      location = "top_left";
    };
  };
}
