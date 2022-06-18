local wezterm = require('wezterm')

return {
   enable_wayland = true,
   font = wezterm.font('mononoki NF'),
   hide_tab_bar_if_only_one_tab = true,
   colors = { background = '#1a1b26' },
   leader = { key = ',', mods = 'CTRL' },
   keys = {
      { key = 'c', mods = 'LEADER', action = wezterm.action({ SplitHorizontal = { domain = 'CurrentPaneDomain' } }) },
      { key = 'r', mods = 'LEADER', action = wezterm.action({ SplitVertical = { domain = 'CurrentPaneDomain' } }) },
      {
         key = 's',
         mods = 'LEADER',
         action = wezterm.action({ ActivateKeyTable = { name = 'resize', one_shot = false } }),
      },
      { key = 'h', mods = 'LEADER', action = wezterm.action({ ActivatePaneDirection = 'Left' }) },
      { key = 'l', mods = 'LEADER', action = wezterm.action({ ActivatePaneDirection = 'Right' }) },
      { key = 'k', mods = 'LEADER', action = wezterm.action({ ActivatePaneDirection = 'Up' }) },
      { key = 'j', mods = 'LEADER', action = wezterm.action({ ActivatePaneDirection = 'Down' }) },
   },
   key_tables = {
      resize = {
         { key = 'h', action = wezterm.action({ AdjustPaneSize = { 'Left', 5 } }) },
         { key = 'j', action = wezterm.action({ AdjustPaneSize = { 'Down', 5 } }) },
         { key = 'k', action = wezterm.action({ AdjustPaneSize = { 'Up', 5 } }) },
         { key = 'l', action = wezterm.action({ AdjustPaneSize = { 'Right', 5 } }) },
         { key = 'Escape', action = 'PopKeyTable' },
      },
   },
}
