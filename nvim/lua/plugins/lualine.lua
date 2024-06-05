return {
   'nvim-lualine/lualine.nvim',
   config = function()
      local lualine = require('lualine')
      local noice = require('noice')
      local colors = require('tokyonight.colors').setup({ transform = true })

      local function winbarActive()
         local function is_window_float(window)
            local cfg = vim.api.nvim_win_get_config(window)
            return cfg.relative > '' or cfg.external
         end

         local function is_window_invalid_filetype(window)
            local ft = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(window), 'filetype')

            return ft:match('^NvimTree$')
               or ft:match('^packer$')
               or ft:match('^fugitive$')
               or ft:match('^fugitiveblame$')
               or ft:match('^help$')
               or ft:match('^toggleterm$')
         end

         local windows = vim.api.nvim_tabpage_list_wins(vim.api.nvim_get_current_tabpage())
         local window_count = 0

         for _, window in pairs(windows) do
            if not is_window_float(window) and not is_window_invalid_filetype(window) then
               window_count = window_count + 1
            end
         end
         return window_count > 1
      end

      local separator_left = { separator = { left = '' } }
      local separator_right = { separator = { right = '' } }

      local teal_component = { color = { fg = colors.fg_gutter, bg = colors.teal } }
      local teal_component_right = vim.tbl_extend('keep', separator_left, teal_component)
      local teal_component_left = vim.tbl_extend('keep', separator_right, teal_component)

      local dark_component = { color = { fg = colors.fg, bg = colors.dark3 } }
      local dark_component_right = vim.tbl_extend('keep', separator_left, dark_component)
      local dark_component_left = vim.tbl_extend('keep', separator_right, dark_component)

      local orange_component = { color = { fg = colors.fg_gutter, bg = colors.orange } }
      local orange_component_right = vim.tbl_extend('keep', separator_left, orange_component)
      local orange_component_left = vim.tbl_extend('keep', separator_right, orange_component)

      local bg_component = { color = { bg = colors.bg_dark } }

      lualine.setup({
         options = {
            theme = 'tokyonight',
            globalstatus = true,
         },
         sections = {
            lualine_a = {
               vim.tbl_extend(
                  'keep',
                  { noice.api.status.mode.get, cond = noice.api.status.mode.has },
                  orange_component_left
               ),
               vim.tbl_extend('keep', { 'mode' }, teal_component_left),
               vim.tbl_extend('keep', { 'branch' }, dark_component_left),
               vim.tbl_extend('keep', { 'diagnostics', colored = true }, bg_component),
            },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {
               vim.tbl_extend('keep', { 'searchcount' }, orange_component_right),
               vim.tbl_extend('keep', { 'location' }, teal_component_right),
               vim.tbl_extend('keep', { 'progress' }, dark_component_right),
            },
         },
         winbar = {
            lualine_a = {
               {
                  'filename',
                  cond = winbarActive,
               },
            },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
         },
         inactive_winbar = {
            lualine_a = {
               {
                  'filename',
                  cond = winbarActive,
               },
            },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
         },
      })
   end,
   dependencies = {
      'kyazdani42/nvim-web-devicons',
      require('plugins.tokyonight'),
   },
}
