local wezterm = require('wezterm')
local action = wezterm.action

return {
   enable_wayland = true,
   font = wezterm.font('mononoki Nerd Font'),
   hide_tab_bar_if_only_one_tab = true,
   color_scheme = 'tokyonight',
   leader = { key = ',', mods = 'CTRL' },
   keys = {
      { key = 'c', mods = 'LEADER', action = action.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
      { key = 'r', mods = 'LEADER', action = action.SplitVertical({ domain = 'CurrentPaneDomain' }) },
      {
         key = 's',
         mods = 'LEADER',
         action = action.ActivateKeyTable({ name = 'resize', one_shot = false, replace_current = true }),
      },
      { key = 'h', mods = 'LEADER', action = action.ActivatePaneDirection('Left') },
      { key = 'l', mods = 'LEADER', action = action.ActivatePaneDirection('Right') },
      { key = 'k', mods = 'LEADER', action = action.ActivatePaneDirection('Up') },
      { key = 'j', mods = 'LEADER', action = action.ActivatePaneDirection('Down') },
   },
   key_tables = {
      resize = {
         { key = 'h', action = action.AdjustPaneSize({ 'Left', 5 }) },
         { key = 'j', action = action.AdjustPaneSize({ 'Down', 5 }) },
         { key = 'k', action = action.AdjustPaneSize({ 'Up', 5 }) },
         { key = 'l', action = action.AdjustPaneSize({ 'Right', 5 }) },
         { key = 'Escape', action = action.PopKeyTable },
      },
   },
}
