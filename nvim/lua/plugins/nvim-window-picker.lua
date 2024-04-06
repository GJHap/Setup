return {
   's1n7ax/nvim-window-picker',
   lazy = true,
   init = function()
      local nnoremap = require('util').nnoremap
      nnoremap('<Leader>w', function()
         local picked_window_id = require('window-picker').pick_window() or vim.api.nvim_get_current_win()
         vim.api.nvim_set_current_win(picked_window_id)
      end, { desc = 'Window Picker' })
   end,
   config = true,
   opts = {
      selection_chars = 'ABCDEFGHIJ',
      filter_rules = {
         bo = {
            filetype = {},
            buftype = {},
         },
      },
      highlights = {
         statusline = {
            unfocused = {
               bg = '#4493c8',
            },
         },
      },
   },
}
