local util = require('util')
local prequire = util.prequire
local nnoremap = util.nnoremap

prequire('dap', function(dap)
   nnoremap('<F5>', dap.continue)
   nnoremap('<F10>', dap.step_over)
   nnoremap('<F11>', dap.step_into)
   nnoremap('<Leader>db', dap.toggle_breakpoint)
   nnoremap('<Leader>dB', function()
      dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
   end)
   nnoremap('<Leader>dq', dap.terminate)
   nnoremap('<Leader>de', function()
      dap.set_exception_breakpoints({ 'all' })
   end)
   nnoremap('<Leader>dd', function()
      dap.set_exception_breakpoints({})
   end)

   vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'Error', linehl = '', numhl = '' })
   vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'Error', linehl = '', numhl = '' })
   vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'Error', linehl = '', numhl = '' })
end)
