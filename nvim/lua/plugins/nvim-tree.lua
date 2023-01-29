return {
   'kyazdani42/nvim-tree.lua',
   lazy = true,
   init = function()
      local nnoremap = require('util').nnoremap
      nnoremap('<Leader>tt', function()
         require('nvim-tree').toggle()
      end, { desc = 'Toggle File Tree' })
   end,
   config = true,
   opts = {
      respect_buf_cwd = true,
      view = {
         adaptive_size = true,
         mappings = {
            list = {
               { key = '<Leader>sr', action = 'split' },
               { key = '<Leader>sc', action = 'vsplit' },
            },
         },
      },
      update_focused_file = { enable = true },
      hijack_directories = { enable = false },
   },

   dependencies = { 'kyazdani42/nvim-web-devicons' },
}
