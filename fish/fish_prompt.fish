function directory_prompt -a prev_bg current_bg current_fg
   generate_prompt $prev_bg $current_bg $current_fg (printf ' %s ' (prompt_pwd))
end

function end_prompt -a prev_bg current_bg current_fg
   generate_prompt $prev_bg $current_bg $current_fg " "
end

function fish_prompt
   set -f status_prompt (status_prompt $background $red normal)
   set -f directory_prompt (directory_prompt $status_prompt[2] $purple black)
   set -f git_prompt (git_prompt $directory_prompt[2] $orange black)
   set -f end_prompt (end_prompt $git_prompt[2] normal normal)

   printf '%s%s%s%s' $status_prompt[1] $directory_prompt[1] $git_prompt[1] $end_prompt[1]
end

function generate_prompt -a prev_bg current_bg current_fg text
   set -f symbol_prompt (set_color $prev_bg -b $current_bg) (echo "")
   set -f text_prompt (set_color $current_fg -b $current_bg) (echo $text)
   set -f prompt (printf '%s%s' $symbol_prompt $text_prompt)

   printf '%s\n%s' $prompt $current_bg
   end

function git_prompt -a prev_bg current_bg current_fg
   set -f git_prompt (fish_git_prompt %s)
   if string length -q $git_prompt
      generate_prompt $prev_bg $current_bg $current_fg (printf '  %s ' $git_prompt)
   else
      printf '%s\n%s' "" $prev_bg
   end
end

function status_prompt -a prev_bg current_bg current_fg
   if test $status -ne 0
      generate_prompt $prev_bg $current_bg $current_fg ""
   else
      printf '%s\n%s' "" $prev_bg
   end
end
