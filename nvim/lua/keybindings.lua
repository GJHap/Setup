util = require('util')

local function buffer()
   util.nnoremap('<Leader>bn', ':bN <CR>')
   util.nnoremap('<Leader>bp', ':bp <CR>')
   util.nnoremap('<Leader>bd', ':bd <CR>')
end

local function dap()
   util.nnoremap('<F5>', ":lua require('dap').continue()<CR>")
   util.nnoremap('<F10>', ":lua require('dap').step_over()<CR>")
   util.nnoremap('<F11>', ":lua require('dap').step_into()<CR>")
   util.nnoremap('<Leader>db', ":lua require('dap').toggle_breakpoint()<CR>")
   util.nnoremap('<Leader>dB', ":lua require('dap').toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
   util.nnoremap('<Leader>dq', ":lua require('dap').terminate()<CR>")
   util.nnoremap('<Leader>dui', ":lua require('dapui').toggle()<CR>")
end

local function git()
   util.nnoremap('<Leader>ga', ':Git add .<CR>')
   util.nnoremap('<Leader>gs', ':Git status <CR>')
   util.nnoremap('<Leader>gb', ':Git blame <CR>')
   util.nnoremap('<Leader>gl', ':Git log <CR>')
   util.nnoremap('<Leader>gpl', ':Git pull <CR>')
   util.nnoremap('<Leader>gps', ':Git push <CR>')
   util.nnoremap('<Leader>gc', ':Git commit <CR>')
end

local function move_line()
   util.inoremap('<A-j>', '<Esc>:m .+1<CR>==gi')
   util.nnoremap('<A-j>', ':m .+1<CR>==')
   util.vnoremap('<A-j>', ":m '>+1<CR>gv=gv")
   util.inoremap('<A-k>', '<Esc>:m .-2<CR>==gi')
   util.nnoremap('<A-k>', ':m .-2<CR>==')
   util.vnoremap('<A-k>', ":m '<-2<CR>gv=gv")
end

local function saga()
   util.nnoremap('<Leader>ca', ':Lspsaga code_action<CR>')
   util.nnoremap('<Leader>rr', ':Lspsaga rename<CR>')
end

local function tab()
   util.nnoremap('<Leader>tn', ':tabnext <CR>')
   util.nnoremap('<Leader>tp', ':tabprevious <CR>')
   util.nnoremap('<Leader>ta', ':tabnew <CR>')
   util.nnoremap('<Leader>tw', ':tabclose <CR>')
end

local function tree()
   util.nnoremap('<Leader>tr', ':NvimTreeToggle<CR>')
end

local function trouble()
   util.nnoremap('<Leader>lr', ':TroubleToggle lsp_references <CR>')
   util.nnoremap('<Leader>ld', ':TroubleToggle lsp_definitions <CR>')
   util.nnoremap('<Leader>lp', ':TroubleToggle document_diagnostics <CR>')
end

local function telescope()
   util.nnoremap('<Leader>ff', ':Telescope find_files<CR>')
end

buffer()
dap()
git()
move_line()
saga()
tab()
telescope()
tree()
trouble()
