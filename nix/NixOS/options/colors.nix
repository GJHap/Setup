{ lib, ... }: {
  options = {
    colors = lib.mkOption {
      default = {
        background = "282A36";
        foreground = "F8F8F2";
        green = "50FA7B";
        purple = "BD93F9";
        red = "FF5555";
        sway-hover = "4B5563";
        sway-module = "374151";
      };
      type = lib.types.attrs;
    };
  };
}
