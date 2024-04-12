function fish_mode_prompt
  set_color $yellow
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
