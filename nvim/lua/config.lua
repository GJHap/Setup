vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.expandtab = true
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.fillchars = { fold = ' ', foldopen = '', foldclose = '' }
vim.opt.foldcolumn = '1'
vim.opt.foldtext = 'getline(v:foldstart)'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.g.mapleader = ','
vim.o.guifont = 'mononoki Nerd Font'
vim.o.laststatus = 3
