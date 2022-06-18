local util = require('util')
local prequire = util.prequire
local nnoremap = util.nnoremap

prequire('telescope', function(telescope)
   local mappings = {}
   prequire('telescope.actions', function(actions)
      mappings = {
         n = {
            ['<Leader>sc'] = actions.select_vertical,
            ['<Leader>sr'] = actions.select_horizontal,
         },
      }
   end)

   local fixfolds = {}
   prequire('telescope.actions.set', function(actions)
      fixfolds = {
         hidden = true,
         attach_mappings = function(_)
            actions.select:enhance({
               post = function()
                  vim.cmd(':normal! zx')
               end,
            })
            return true
         end,
      }
   end)

   telescope.setup({
      defaults = {
         path_display = { shorten = { exclude = { -1, -2 } } },
         mappings = mappings,
         vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--trim',
         },
         layout_config = {
            height = 0.99,
            width = 0.99,
         },
         layout_strategy = 'vertical',
         dynamic_preview_title = true,
      },
      pickers = {
         buffers = fixfolds,
         find_files = fixfolds,
         live_grep = fixfolds,
         diagnostics = fixfolds,
         lsp_references = {
            trim_text = true,
         },
         lsp_definitions = {
            trim_text = true,
         },
         lsp_implementations = {
            trim_text = true,
         },
      },
   })

   prequire('telescope.builtin', function(builtin)
      nnoremap('<Leader>ff', builtin.find_files)
      nnoremap('<Leader>fb', builtin.buffers)
      nnoremap('<Leader>fg', builtin.live_grep)
      nnoremap('<Leader>lr', builtin.lsp_references)
      nnoremap('<Leader>lp', builtin.diagnostics)
      nnoremap('<Leader>li', builtin.lsp_implementations)
      nnoremap('<Leader>ld', builtin.lsp_definitions)
   end)
end)
