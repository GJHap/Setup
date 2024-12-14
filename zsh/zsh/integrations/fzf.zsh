function set_fzf_command() {
   export FZF_DEFAULT_COMMAND=$1
   export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}

function set_fzf_command_default() {
   set_fzf_command "rg --files"
}
set_fzf_command_default

function set_fzf_command_gitignore() {
   set_fzf_command
}

if command -v fzf &> /dev/null; then
   eval "$(fzf --zsh)"
fi

