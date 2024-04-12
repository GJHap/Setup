{ ... }: {
  services.gammastep = {
    enable = true;
    provider = "geoclue2";
    settings = { general = { adjustment-method = "wayland"; }; };
    temperature = {
      day = 6500;
      night = 3250;
    };
  };
}
