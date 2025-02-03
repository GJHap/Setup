if [[ -f ~/zsh/pre.zsh ]]; then
  source ~/zsh/pre.zsh
fi

source ~/zsh/integrations/index.zsh
source ~/zsh/plugin.zsh
source ~/zsh/global.zsh
source ~/zsh/history.zsh
source ~/zsh/alias.zsh
source ~/zsh/style.zsh
source ~/zsh/theme.zsh
source ~/zsh/prompt.zsh
source ~/zsh/path.zsh

if [[ -f ~/zsh/post.zsh ]]; then
  source ~/zsh/post.zsh
fi
