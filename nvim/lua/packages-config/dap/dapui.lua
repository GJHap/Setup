local dapui = require('dapui')
dapui.setup{}

local dap = require('dap')

local util = require('util')
local nnoremap = util.nnoremap
local vnoremap = util.vnoremap

nnoremap('<F5>', dap.continue)
nnoremap('<F10>', dap.step_over)
nnoremap('<F11>', dap.step_into)
nnoremap('<Leader>db', dap.toggle_breakpoint)
nnoremap('<Leader>dB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
nnoremap('<Leader>dq', dap.terminate)
nnoremap('<Leader>dee', function() dap.set_exception_breakpoints({ 'all' }) end)
nnoremap('<Leader>ded', function() dap.set_exception_breakpoints({}) end)
nnoremap('<Leader>dui', dapui.toggle)
nnoremap('<Leader>ds', function() dapui.float_element('stacks', { enter = true }) end)
nnoremap('<Leader>dw', function() dapui.float_element('watches', { enter = true }) end)
nnoremap('<Leader>dl', function() dapui.float_element('scopes', { enter = true }) end)
nnoremap('<Leader>dp', function() dapui.float_element('breakpoints', { enter = true }) end)
nnoremap('<Leader>dr', function() dapui.float_element('repl', { enter = true }) end)
nnoremap('<Leader>dh', dapui.eval)
vnoremap('<Leader>dh', dapui.eval)

vim.fn.sign_define('DapBreakpoint', { text = '', texthl='Error', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl='Error', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl='Error', linehl='', numhl='' })
