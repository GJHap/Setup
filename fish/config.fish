starship init fish | source
fish_vi_key_bindings
set fish_greeting

function fish_mode_prompt
  set_color --bold \#41a6b5
  switch $fish_bind_mode
    case default
      echo -n 'N'
    case insert
      echo -n 'I'
    case replace_one
      echo 'R'
    case visual
      echo 'V'
    case '*'
      echo '?'
  end
end
