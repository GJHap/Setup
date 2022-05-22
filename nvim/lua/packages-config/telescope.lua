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

local builtin = require('telescope.builtin')
nnoremap('<Leader>ff', builtin.find_files)
nnoremap('<Leader>fb', builtin.buffers)
nnoremap('<Leader>fg', builtin.live_grep)
nnoremap('<Leader>lr', builtin.lsp_references)
nnoremap('<Leader>lp', builtin.diagnostics)
nnoremap('<Leader>li', builtin.lsp_implementations)
nnoremap('<Leader>ld', builtin.lsp_definitions)
