if test -f ~/.config/fish/pre.fish
   source ~/.config/fish/pre.fish
end

if status is-interactive; and type -q tmux; and not set -q TMUX; tmux new-session -A -s main; end

set -x EDITOR nvim
set -x PAGER less
set -x BROWSER brave

fish_vi_key_bindings
set fish_greeting

source ~/.config/fish/theme.fish
source ~/.config/fish/prompt.fish
