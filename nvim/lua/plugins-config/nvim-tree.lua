local prequire = require('util').prequire

prequire('nvim-tree', function(nvim_tree)
   nvim_tree.setup({
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
   })

   local nnoremap = require('util').nnoremap
   nnoremap('<Leader>tt', nvim_tree.toggle, { desc = 'Toggle File Tree' })
end)
