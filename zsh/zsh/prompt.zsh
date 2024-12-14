function directory_prompt() {
   local prev_bg=$1
   local current_bg=$2
   local current_fg=$3

   generate_prompt $1 $2 $3 " %4~ "
}

function end_prompt {
   generate_prompt $1 $2 $3 ""
}

function generate_prompt() {
   local prev_bg=$1
   local current_bg=$2
   local current_fg=$3
   local text=$4
   local symbol_prompt="%F{$prev_bg}%K{$current_bg}%k%f"
   local text_prompt="%F{$current_fg}%K{$current_bg}$text%k%f"
   local p=$(printf '%s%s' $symbol_prompt $text_prompt)

   reply=($p $current_bg)
}

function git_prompt() {
   if command -v git &> /dev/null && [[ -d .git ]]; then
      local text=""
      local branch="$(git branch --show-current)"
      if [[ -n "$branch" ]]; then
         text=$(echo "  $branch ")
      fi

      generate_prompt $1 $2 $3 $text
   else
      reply=("\0" $1)
   fi
}

function status_prompt() {
   if [[ $? -ne 0 ]]; then
      generate_prompt $1 $2 $3 ""
   else
      reply=("\0" $1)
   fi
}

function vi_mode {
  echo %F{yellow}${ZVM_MODE:u}%f
}

function prompt() {
   v=$(vi_mode)

   status_prompt black red normal
   s=("${reply[@]}")

   directory_prompt $s[2] magenta black
   d=("${reply[@]}")

   git_prompt $d[2] yellow black
   g=("${reply[@]}")

   end_prompt $g[2] normal normal
   e=("${reply[@]}")

   echo "$v$s[1]$d[1]$g[1]$e[1] "
}

setopt prompt_subst
export PS1='$(prompt)'
