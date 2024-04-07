{ pkgs, ... }: {
  home.packages = with pkgs; [
    fd
    fish
    fzf
    gh
    git
    lf
    neovim
    ripgrep
    starship
    tmux
    unzip
  ];
}
