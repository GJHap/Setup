if status is-interactive; and type -q tmux; and not set -q TMUX; tmux new-session -A -s main; end

fish_vi_key_bindings
set fish_greeting

source ~/.config/fish/theme.fish
source ~/.config/fish/prompt.fish
