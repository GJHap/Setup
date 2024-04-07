{ pkgs, ... }: {
  home.packages = with pkgs; [
    fd
    fish
    fzf
    gh
    git
    jq
    lf
    neovim
    ripgrep
    starship
    tmux
    unzip
  ];
}
