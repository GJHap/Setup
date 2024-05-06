{ pkgs, ... }: {
  home.packages = with pkgs; [ fd fzf gh git jq ripgrep unzip zip ];
}
