return {
   'nvim-telescope/telescope.nvim',
   lazy = true,
   init = function()
      local nnoremap = require('util').nnoremap
      nnoremap('<Leader>ff', function()
         require('telescope.builtin').find_files()
      end, { desc = 'Find Files' })
      nnoremap('<Leader>fb', function()
         require('telescope.builtin').buffers()
      end, { desc = 'Find Buffers' })
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
      nnoremap('<Leader>lr', function()
         require('telescope.builtin').lsp_references()
      end, { desc = 'Find References' })
      nnoremap('<Leader>lp', function()
         require('telescope.builtin').diagnostics()
      end, { desc = 'Find Diagnostic Errors' })
      nnoremap('<Leader>li', function()
         require('telescope.builtin').lsp_implementations()
      end, { desc = 'Find Implementations' })
      nnoremap('<Leader>ldd', function()
         require('telescope.builtin').lsp_definitions()
      end, { desc = 'Find Definitions' })
      nnoremap('<Leader>ldr', function()
         require('telescope.builtin').lsp_definitions({ jump_type = 'split' })
      end, { desc = 'Find Definitions (Split Row)' })
      nnoremap('<Leader>ldc', function()
         require('telescope.builtin').lsp_definitions({ jump_type = 'vsplit' })
      end, { desc = 'Find Definitions (Open Column)' })
   end,
   config = function()
      local actions = require('telescope.actions')

      local function multiopen(prompt_bufnr, method)
         local edit_file_cmd_map = {
            vertical = 'vsplit',
            horizontal = 'split',
            tab = 'tabedit',
            default = 'edit',
         }
         local edit_buf_cmd_map = {
            vertical = 'vert sbuffer',
            horizontal = 'sbuffer',
            tab = 'tab sbuffer',
            default = 'buffer',
         }
         local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
         local multi_selection = picker:get_multi_selection()

         if #multi_selection > 1 then
            require('telescope.pickers').on_close_prompt(prompt_bufnr)
            pcall(vim.api.nvim_set_current_win, picker.original_win_id)

            for i, entry in ipairs(multi_selection) do
               local filename, row, col

               if entry.path or entry.filename then
                  filename = entry.path or entry.filename

                  row = entry.row or entry.lnum
                  col = vim.F.if_nil(entry.col, 1)
               elseif not entry.bufnr then
                  local value = entry.value
                  if not value then
                     return
                  end

                  if type(value) == 'table' then
                     value = entry.display
                  end

                  local sections = vim.split(value, ':')

                  filename = sections[1]
                  row = tonumber(sections[2])
                  col = tonumber(sections[3])
               end

               local entry_bufnr = entry.bufnr

               if entry_bufnr then
                  if not vim.api.nvim_buf_get_option(entry_bufnr, 'buflisted') then
                     vim.api.nvim_buf_set_option(entry_bufnr, 'buflisted', true)
                  end
                  local command = i == 1 and 'buffer' or edit_buf_cmd_map[method]
                  pcall(vim.cmd, string.format('%s %s', command, vim.api.nvim_buf_get_name(entry_bufnr)))
               else
                  local command = i == 1 and 'edit' or edit_file_cmd_map[method]
                  if vim.api.nvim_buf_get_name(0) ~= filename or command ~= 'edit' then
                     filename = require('plenary.path'):new(vim.fn.fnameescape(filename)):normalize(vim.loop.cwd())
                     pcall(vim.cmd, string.format('%s %s', command, filename))
                  end
               end

               if row and col then
                  pcall(vim.api.nvim_win_set_cursor, 0, { row, col })
               end
            end
         else
            actions['select_' .. method](prompt_bufnr)
         end
      end

      local select_items = function(prompt_bufnr)
         multiopen(prompt_bufnr, 'default')
      end

      local fixfolds = {
         hidden = true,
         attach_mappings = function(_)
            require('telescope.actions.set').select:enhance({
               post = function()
                  vim.cmd(':normal! zx')
               end,
            })
            return true
         end,
      }

      local telescope = require('telescope')
      telescope.setup({
         defaults = {
            path_display = { shorten = { exclude = { -1, -2 } } },
            mappings = {
               n = {
                  ['<Leader>sc'] = actions.select_vertical,
                  ['<Leader>sr'] = actions.select_horizontal,
                  ['<C-d>'] = actions.results_scrolling_down,
                  ['<C-u>'] = actions.results_scrolling_up,
                  ['<C-f>'] = actions.preview_scrolling_down,
                  ['<C-b>'] = actions.preview_scrolling_up,
                  ['<CR>'] = select_items,
                  ['<Tab>'] = actions.toggle_selection + actions.move_selection_better,
                  ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_worse,
               },
               i = {
                  ['<C-d>'] = actions.results_scrolling_down,
                  ['<C-u>'] = actions.results_scrolling_up,
                  ['<C-f>'] = actions.preview_scrolling_down,
                  ['<C-b>'] = actions.preview_scrolling_up,
                  ['<CR>'] = select_items,
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
   end,
   dependencies = { 'nvim-lua/plenary.nvim' },
}
