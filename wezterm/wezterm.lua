local navigation_keys = require('nvim-integration')

local wezterm = require('wezterm')
local action = wezterm.action

return {
   font = wezterm.font('JetBrainsMono Nerd Font'),
   hide_tab_bar_if_only_one_tab = true,
   color_scheme = 'tokyonight',
   keys = {
      { key = 'c', mods = 'ALT', action = action.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
      { key = 'r', mods = 'ALT', action = action.SplitVertical({ domain = 'CurrentPaneDomain' }) },
      {
         key = 's',
         mods = 'ALT',
         action = action.ActivateKeyTable({ name = 'resize', one_shot = false, replace_current = true }),
      },
      navigation_keys.left,
      navigation_keys.down,
      navigation_keys.up,
      navigation_keys.right,
      { key = 'f', mods = 'ALT', action = action.TogglePaneZoomState },
      { key = 'q', mods = 'ALT', action = action.CloseCurrentPane({ confirm = false }) },
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
