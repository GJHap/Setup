{ ... }: {
  services.gammastep = {
    enable = true;
    provider = "geoclue2";
    temperature = {
      day = 6500;
      night = 3250;
    };
    settings = { general = { adjustment-method = "wayland"; }; };
  };
}
