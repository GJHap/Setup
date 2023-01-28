local util = require('util')
local prequire = util.prequire

prequire('dapui', function(dapui)
   dapui.setup({})
   local nnoremap = util.nnoremap
   nnoremap('<Leader>du', dapui.toggle, { desc = 'DAP UI - Toggle' })
   nnoremap('<Leader>ds', function()
      dapui.float_element('stacks', { enter = true })
   end, { desc = 'DAP UI - Stacks' })
   nnoremap('<Leader>dw', function()
      dapui.float_element('watches', { enter = true })
   end, { desc = 'DAP UI - Watches' })
   nnoremap('<Leader>dl', function()
      dapui.float_element('scopes', { enter = true })
   end, { desc = 'DAP UI - Scopes' })
   nnoremap('<Leader>dp', function()
      dapui.float_element('breakpoints', { enter = true })
   end, { desc = 'DAP UI - Breakpoints' })
   nnoremap('<Leader>dr', function()
      dapui.float_element('repl', { enter = true })
   end, { desc = 'DAP UI - Repl' })
   nnoremap('<Leader>dh', dapui.eval, { desc = 'DAP UI - Evaluate' })

   local vnoremap = util.vnoremap
   vnoremap('<Leader>dh', dapui.eval, { desc = 'DAP UI - Evaluate' })
end)
