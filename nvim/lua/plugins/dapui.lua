return {
   'rcarriga/nvim-dap-ui',
   lazy = true,
   init = function()
      local util = require('util')

      local nnoremap = util.nnoremap
      nnoremap('<Leader>du', function()
         require('dapui').toggle()
      end, { desc = 'DAP - Toggle UI' })
      nnoremap('<Leader>ds', function()
         require('dapui').float_element('stacks', { enter = true })
      end, { desc = 'DAP - Stacks' })
      nnoremap('<Leader>dw', function()
         require('dapui').float_element('watches', { enter = true })
      end, { desc = 'DAP - Watches' })
      nnoremap('<Leader>dl', function()
         require('dapui').float_element('scopes', { enter = true })
      end, { desc = 'DAP - Scopes' })
      nnoremap('<Leader>dp', function()
         require('dapui').float_element('breakpoints', { enter = true })
      end, { desc = 'DAP - Breakpoints' })
      nnoremap('<Leader>dr', function()
         require('dapui').float_element('repl', { enter = true })
      end, { desc = 'DAP - Repl' })
      nnoremap('<Leader>dh', function()
         require('dapui').eval()
      end, { desc = 'DAP - Evaluate' })

      local vnoremap = util.vnoremap
      vnoremap('<Leader>dh', function()
         require('dapui').eval()
      end, { desc = 'DAP - Evaluate' })
   end,
   config = true,
   dependencies = { require('plugins.dap') },
}
