local actions = require('telescope.actions')
local nnoremap = require('util').nnoremap

require('telescope').setup
{
   defaults =
   {
      path_display = { shorten = { exclude = { -1, -2 } } },
      mappings =
      {
         n =
         {
            ["<Leader>sc"] = actions.select_vertical,
            ["<Leader>sr"] = actions.select_horizontal
         }
      },
      vimgrep_arguments =
      {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim"
        },
        layout_config =
        {
           height = 0.99,
           width = 0.99
        },
        layout_strategy = "vertical",
        dynamic_preview_title = true
   },
   pickers =
   {
      lsp_references =
      {
         trim_text = true
      },
      lsp_definitions =
      {
         trim_text = true
      },
      lsp_implementations =
      {
         trim_text = true
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
