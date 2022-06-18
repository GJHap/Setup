local prequire = require('util').prequire

prequire('feline', function(feline)
   local theme = {}
   prequire('tokyonight.colors', function(colors)
      theme = colors.setup(require('packages-config/tokyonight'))
   end)

   feline.setup({
      theme = theme,
      force_inactive = {},
      components = {
         active = {
            {
               {
                  provider = 'vi_mode',
                  icon = '',
                  left_sep = 'slant_left',
                  right_sep = 'slant_right_2',
                  hl = {
                     bg = 'dark3',
                  },
               },
               {
                  provider = 'git_branch',
                  left_sep = 'slant_left',
                  right_sep = 'slant_right_2',
                  hl = {
                     bg = 'blue0',
                  },
               },
               {
                  provider = 'diagnostic_errors',
                  hl = {
                     fg = 'red',
                  },
               },
               {
                  provider = 'diagnostic_warnings',
                  hl = {
                     fg = 'yellow',
                  },
               },
               {
                  provider = 'diagnostic_hints',
                  hl = {
                     fg = 'dark3',
                  },
               },
            },
            {
               {
                  provider = 'file_info',
                  left_sep = 'slant_left',
                  right_sep = 'slant_right_2',
                  opts = {
                     type = 'base-only',
                  },
                  hl = {
                     bg = 'dark3',
                  },
               },
               {
                  provider = 'position',
                  left_sep = 'slant_left',
                  right_sep = 'slant_right_2',
                  hl = {
                     bg = 'blue0',
                  },
               },
               {
                  provider = 'line_percentage',
                  left_sep = 'slant_left',
                  right_sep = 'slant_right_2',
                  hl = {
                     bg = 'dark3',
                  },
               },
            },
         },
      },
   })

   feline.winbar.setup({
      theme = theme,
      conditional_components = {
         {
            condition = function()
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
            end,
            active = {
               {
                  {
                     provider = 'file_info',
                     left_sep = 'slant_left',
                     right_sep = 'slant_right_2',
                     opts = {
                        type = 'base-only',
                     },
                     hl = {
                        bg = 'dark3',
                     },
                  },
               },
            },
            inactive = {
               {
                  {
                     provider = 'file_info',
                     left_sep = 'slant_left',
                     right_sep = 'slant_right_2',
                     opts = {
                        type = 'base-only',
                     },
                     hl = {
                        bg = 'dark3',
                     },
                  },
               },
            },
         },
      },
      components = {
         active = {},
         inactive = {},
      },
   })
end)
