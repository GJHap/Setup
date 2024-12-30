{ pkgs, ... }: {
  home.packages = with pkgs; [
    bat
    fd
    fzf
    gh
    git
    jq
    lsd
    ripgrep
    unzip
    zip
    zoxide
  ];
}
