local nnoremap = require('util').nnoremap

require('nvim-tree').setup(
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

nnoremap('<Leader>tr', ':NvimTreeToggle<CR>')
