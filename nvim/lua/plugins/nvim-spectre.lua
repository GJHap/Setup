return {
   'nvim-pack/nvim-spectre',
   lazy = true,
   init = function()
      local nnoremap = require('util').nnoremap
      nnoremap('<Leader>st', function()
         local spectre_state = require('spectre.state')
         local spectre = require('spectre')
         if spectre_state.bufnr ~= nil and #vim.fn.win_findbuf(spectre_state.bufnr) >= 1 then
            spectre.close()
         else
            spectre.open()
         end
      end, { desc = 'Find and Replace' })
   end,
   config = true,
   dependencies = { 'nvim-lua/plenary.nvim' },
}
