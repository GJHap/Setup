local util = require('util')
local prequire = util.prequire
local nnoremap = util.nnoremap

prequire('window-picker', function(window_picker)
   window_picker.setup({
      selection_chars = 'ABCDEFGHIJ',
      filter_rules = {
         bo = {
            filetype = {},
            buftype = {},
         },
      },
      other_win_hl_color = '#4493c8',
   })

   nnoremap('<Leader>w', function()
      local picked_window_id = window_picker.pick_window() or vim.api.nvim_get_current_win()
      vim.api.nvim_set_current_win(picked_window_id)
   end)
end)
