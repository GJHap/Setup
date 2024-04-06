return {
   'nvim-lualine/lualine.nvim',
   config = function()
      local lualine = require('lualine')

      local function macro()
         local recording_register = vim.fn.reg_recording()
         if recording_register == '' then
            return ''
         else
            return 'Recording @' .. recording_register
         end
      end

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

      lualine.setup({
         options = {
            theme = 'tokyonight',
            globalstatus = true,
         },
         sections = {
            lualine_a = {
               macro,
               'mode',
               'branch',
               {
                  'diagnostics',
                  colored = false,
               },
            },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {
               'searchcount',
               'location',
               'progress',
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
         tabline = {
            lualine_a = {
               {
                  'buffers',
                  symbols = {
                     alternate_file = '',
                  },
               },
            },
            lualine_z = {
               {
                  'tabs',
                  symbols = {
                     modified = ' ●',
                  },
               },
            },
         },
      })
   end,
   dependencies = {
      'kyazdani42/nvim-web-devicons',
      require('plugins.tokyonight'),
   },
}
