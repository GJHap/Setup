local nnoremap = require('util').nnoremap

require('dapui').setup{}

nnoremap('<F5>', ":lua require('dap').continue()<CR>")
nnoremap('<F10>', ":lua require('dap').step_over()<CR>")
nnoremap('<F11>', ":lua require('dap').step_into()<CR>")
nnoremap('<Leader>db', ":lua require('dap').toggle_breakpoint()<CR>")
nnoremap('<Leader>dB', ":lua require('dap').toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
nnoremap('<Leader>dw', ":lua require('dap').terminate()<CR>")
nnoremap('<Leader>dui', ":lua require('dapui').toggle()<CR>")

