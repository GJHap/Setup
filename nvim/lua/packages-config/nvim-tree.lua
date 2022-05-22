local nvim_tree = require('nvim-tree')

nvim_tree.setup(
{
   view =
   {
      mappings =
      {
         list =
         {
            { key = '<Leader>sr', action = 'split' },
            { key = '<Leader>sc', action = 'vsplit' }
         }
      }
   },
   update_focused_file =
   {
      enable = true,
   },
})

local nnoremap = require('util').nnoremap
nnoremap('<Leader>tt', nvim_tree.toggle)
