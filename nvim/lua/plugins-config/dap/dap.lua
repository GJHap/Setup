local util = require('util')
local prequire = util.prequire

prequire('dap', function(dap)
   local nnoremap = util.nnoremap
   nnoremap('<F5>', dap.continue, { desc = 'DAP - Continue' })
   nnoremap('<F10>', dap.step_over, { desc = 'DAP - Step Over' })
   nnoremap('<F11>', dap.step_into, { desc = 'DAP - Step Into' })
   nnoremap('<Leader>db', dap.toggle_breakpoint, { desc = 'DAP - Toggle Breakpoint' })
   nnoremap('<Leader>dB', function()
      dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
   end, { desc = 'DAP - Conditional Breakpoint' })
   nnoremap('<Leader>dq', dap.terminate, { desc = 'DAP - Terminate Session' })
   nnoremap('<Leader>de', function()
      dap.set_exception_breakpoints({ 'all' })
   end, { desc = 'DAP - Enable break on exception' })
   nnoremap('<Leader>dd', function()
      dap.set_exception_breakpoints({})
   end, { desc = 'DAP - Disable break on exception' })

   vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'Error', linehl = '', numhl = '' })
   vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'Error', linehl = '', numhl = '' })
   vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'Error', linehl = '', numhl = '' })
end)
