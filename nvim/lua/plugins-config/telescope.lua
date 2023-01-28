local util = require('util')
local prequire = util.prequire

prequire('telescope', function(telescope)
   local mappings = {}
   prequire('telescope.actions', function(actions)
      local select_items = actions.select_default
      prequire('telescope.actions.state', function(actions_state)
         prequire('telescope.pickers', function(pickers)
            prequire('plenary.path', function(plenary_path)
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
                  local picker = actions_state.get_current_picker(prompt_bufnr)
                  local multi_selection = picker:get_multi_selection()

                  if #multi_selection > 1 then
                     pickers.on_close_prompt(prompt_bufnr)
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
                              filename = plenary_path:new(vim.fn.fnameescape(filename)):normalize(vim.loop.cwd())
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

               select_items = function(prompt_bufnr)
                  multiopen(prompt_bufnr, 'default')
               end
            end)
         end)
      end)
      mappings = {
         n = {
            ['<Leader>sc'] = actions.select_vertical,
            ['<Leader>sr'] = actions.select_horizontal,
            ['<C-d>'] = actions.results_scrolling_down,
            ['<C-u>'] = actions.results_scrolling_up,
            ['<CR>'] = select_items,
            ['<Tab>'] = actions.toggle_selection + actions.move_selection_better,
            ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_worse,
         },
         i = {
            ['<C-d>'] = actions.results_scrolling_down,
            ['<C-u>'] = actions.results_scrolling_up,
            ['<CR>'] = select_items,
            ['<Tab>'] = actions.toggle_selection + actions.move_selection_better,
            ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_worse,
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
      local nnoremap = util.nnoremap
      nnoremap('<Leader>ff', builtin.find_files, { desc = 'Find Files' })
      nnoremap('<Leader>fb', builtin.buffers, { desc = 'Find Buffers' })
      nnoremap('<Leader>fg', builtin.live_grep, { desc = 'Find Text' })
      nnoremap('<Leader>fk', function()
         builtin.keymaps({
            layout_config = {
               height = 0.40,
               width = 0.99,
               prompt_position = 'top',
               anchor = 'N',
            },
         })
      end, { desc = 'Find Keymaps' })
      nnoremap('<Leader>lr', builtin.lsp_references, { desc = 'Find References' })
      nnoremap('<Leader>lp', builtin.diagnostics, { desc = 'Find Diagnostic Errors' })
      nnoremap('<Leader>li', builtin.lsp_implementations, { desc = 'Find Implementations' })
      nnoremap('<Leader>ldd', builtin.lsp_definitions, { desc = 'Find Definitions' })
      nnoremap('<Leader>ldr', function()
         builtin.lsp_definitions({ jump_type = 'split' })
      end, { desc = 'Find Definitions (Split Row)' })
      nnoremap('<Leader>ldc', function()
         builtin.lsp_definitions({ jump_type = 'vsplit' })
      end, { desc = 'Find Definitions (Open Column)' })
   end)
end)
