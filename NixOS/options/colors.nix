{ lib, ... }: {
  options = {
    colors = lib.mkOption {
      type = lib.types.attrs;
      description = "Colors";
      default = {
        background = "282A36";
        foreground = "F8F8F2";
        purple = "BD93F9";
        green = "50FA7B";
        red = "FF5555";
        sway-module = "374151";
        sway-hover = "4B5563";
      };
    };
  };
}
