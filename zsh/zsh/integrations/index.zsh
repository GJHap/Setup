autoload -Uz compinit && compinit

source ~/zsh/integrations/fzf.zsh

if command -v direnv &> /dev/null; then
   eval "$(direnv hook zsh)"
fi

if command -v zoxide &> /dev/null; then
   eval "$(zoxide init zsh)"
fi

if [[ -t 1 ]] && command -v tmux &> /dev/null && [[ -z "$TMUX" ]]; then
  tmux new-session -A -s main
fi
