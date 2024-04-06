vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars = { fold = ' ', foldopen = '', foldclose = '' }
vim.opt.foldcolumn = '1'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldmethod = 'expr'
vim.opt.foldtext = 'getline(v:foldstart)'
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 3
vim.opt.showmode = false
vim.opt.softtabstop = 3
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true

vim.g.mapleader = ' '

vim.o.guifont = 'JetBrainsMono Nerd Font'
