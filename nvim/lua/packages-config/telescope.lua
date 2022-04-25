local actions = require('telescope.actions')
local nnoremap = require('util').nnoremap

require('telescope').setup
{
   defaults =
   {
      mappings =
      {
         n =
         {
            ["<Leader>sc"] = actions.select_vertical,
            ["<Leader>sr"] = actions.select_horizontal
         }
      }
   }
}

nnoremap('<Leader>ff', ':Telescope find_files<CR>')
