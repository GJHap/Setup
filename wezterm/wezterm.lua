local wezterm = require('wezterm')

return {
   color_scheme = 'tokyonight',
   disable_default_key_bindings = true,
   font = wezterm.font('JetBrainsMono Nerd Font'),
   hide_tab_bar_if_only_one_tab = true,
   keys = {
      {
         key = 'v',
         mods = 'CTRL|SHIFT',
         action = wezterm.action.PasteFrom('Clipboard'),
      },
   },
}
