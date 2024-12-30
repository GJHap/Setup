{ pkgs, ... }: {
  config = {
    description = "Gregory Hapgood";
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
