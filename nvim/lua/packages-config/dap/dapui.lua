require('dapui').setup{}

local nnoremap = require('util').nnoremap
nnoremap('<F5>', ":lua require('dap').continue() <CR>")
nnoremap('<F10>', ":lua require('dap').step_over() <CR>")
nnoremap('<F11>', ":lua require('dap').step_into() <CR>")
nnoremap('<Leader>db', ":lua require('dap').toggle_breakpoint() <CR>")
nnoremap('<Leader>dB', ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) <CR>")
nnoremap('<Leader>dq', ":lua require('dap').terminate() <CR>")
nnoremap('<Leader>dee', ":lua require('dap').set_exception_breakpoints({ 'all' }) <CR>")
nnoremap('<Leader>ded', ":lua require('dap').set_exception_breakpoints({}) <CR>")
nnoremap('<Leader>dui', ":lua require('dapui').toggle() <CR>")

vim.fn.sign_define('DapBreakpoint', { text = '', texthl='Error', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl='Error', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl='Error', linehl='', numhl='' })
