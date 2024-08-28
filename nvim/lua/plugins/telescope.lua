return {
   'nvim-telescope/telescope.nvim',
   lazy = true,
   init = function()
      local nnoremap = require('util').nnoremap
      nnoremap('<Leader>fb', function()
         require('telescope.builtin').buffers()
      end, { desc = 'Find Buffers' })
      nnoremap('<Leader>ff', function()
         require('telescope.builtin').find_files()
      end, { desc = 'Find Files' })
      nnoremap('<Leader>fg', function()
         require('telescope.builtin').live_grep()
      end, { desc = 'Find Text' })
      nnoremap('<Leader>fk', function()
         require('telescope.builtin').keymaps({
            layout_config = {
               height = 0.40,
               width = 0.99,
               prompt_position = 'top',
               anchor = 'N',
            },
         })
      end, { desc = 'Find Keymaps' })
      nnoremap('<Leader>fq', function()
         require('telescope.builtin').quickfix()
      end, { desc = 'Find Keymaps' })

      nnoremap('<Leader>ld-', function()
         require('telescope.builtin').lsp_definitions({ jump_type = 'split' })
      end, { desc = 'Find Definitions (Split Row)' })
      nnoremap('<Leader>ld|', function()
         require('telescope.builtin').lsp_definitions({ jump_type = 'vsplit' })
      end, { desc = 'Find Definitions (Open Column)' })
      nnoremap('<Leader>ldd', function()
         require('telescope.builtin').lsp_definitions()
      end, { desc = 'Find Definitions' })
      nnoremap('<Leader>li', function()
         require('telescope.builtin').lsp_implementations()
      end, { desc = 'Find Implementations' })
      nnoremap('<Leader>lp', function()
         require('telescope.builtin').diagnostics()
      end, { desc = 'Find Diagnostic Errors' })
      nnoremap('<Leader>lr', function()
         require('telescope.builtin').lsp_references()
      end, { desc = 'Find References' })

      vim.api.nvim_create_autocmd({ 'BufEnter' }, {
         pattern = { '*' },
         command = 'normal zx',
      })
   end,
   config = function()
      local actions = require('telescope.actions')

      local telescope = require('telescope')
      telescope.setup({
         defaults = {
            path_display = { shorten = { exclude = { -1, -2 } } },
            mappings = {
               n = {
                  ['<Leader>|'] = actions.select_vertical,
                  ['<Leader>-'] = actions.select_horizontal,
                  ['<C-d>'] = actions.results_scrolling_down,
                  ['<C-u>'] = actions.results_scrolling_up,
                  ['<C-f>'] = actions.preview_scrolling_down,
                  ['<C-b>'] = actions.preview_scrolling_up,
                  ['<Tab>'] = actions.toggle_selection + actions.move_selection_better,
                  ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_worse,
               },
               i = {
                  ['<C-d>'] = actions.results_scrolling_down,
                  ['<C-u>'] = actions.results_scrolling_up,
                  ['<C-f>'] = actions.preview_scrolling_down,
                  ['<C-b>'] = actions.preview_scrolling_up,
                  ['<Tab>'] = actions.toggle_selection + actions.move_selection_better,
                  ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_worse,
               },
            },
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
   end,
   dependencies = { 'nvim-lua/plenary.nvim' },
}
