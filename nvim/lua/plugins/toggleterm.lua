return {
   'akinsho/toggleterm.nvim',
   lazy = true,
   init = function()
      local util = require('util')
      local nnoremap = util.nnoremap
      nnoremap('<C-\\>', function()
         local tab = vim.api.nvim_get_current_tabpage()
         require('toggleterm').toggle(tab)
      end, { desc = 'Toggle Terminal' })

      local tnoremap = util.tnoremap
      tnoremap('<C-\\>', function()
         local tab = vim.api.nvim_get_current_tabpage()
         require('toggleterm').toggle(tab)
      end, { desc = 'Toggle Terminal' })
      tnoremap('<esc>', [[<C-\><C-n>]], { desc = 'Normal Mode (From Term Mode)' })
   end,
   config = true,
   opts = {
      shade_terminals = false,
   },
}
