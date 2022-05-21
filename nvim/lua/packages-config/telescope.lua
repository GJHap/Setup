local actions = require('telescope.actions')
local nnoremap = require('util').nnoremap

require('telescope').setup
{
   defaults =
   {
      path_display = { shorten = { exclude = { -1, -2 } } },
      wrap_results = true,
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

nnoremap('<Leader>ff', ':Telescope find_files <CR>')
nnoremap('<Leader>fb', ':Telescope buffers <CR>')
nnoremap('<Leader>fg', ':Telescope live_grep<CR>')

nnoremap('<Leader>lr', ':Telescope lsp_references <CR>')
nnoremap('<Leader>lp', ':Telescope diagnostics <CR>')
nnoremap('<Leader>li', ':Telescope lsp_implementations <CR>')
nnoremap('<Leader>ld', ':Telescope lsp_definitions <CR>')
