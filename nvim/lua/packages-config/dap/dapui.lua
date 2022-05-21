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
nnoremap('<Leader>ds', ":lua require('dapui').float_element('stacks', { enter = true }) <CR>")
nnoremap('<Leader>dw', ":lua require('dapui').float_element('watches', { enter = true }) <CR>")
nnoremap('<Leader>dl', ":lua require('dapui').float_element('scopes', { enter = true }) <CR>")
nnoremap('<Leader>dp', ":lua require('dapui').float_element('breakpoints', { enter = true }) <CR>")
nnoremap('<Leader>dr', ":lua require('dapui').float_element('repl', { enter = true }) <CR>")

vim.fn.sign_define('DapBreakpoint', { text = '', texthl='Error', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl='Error', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl='Error', linehl='', numhl='' })
