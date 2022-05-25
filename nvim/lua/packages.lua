require('packer').startup(function(use)
   use { 'wbthomason/packer.nvim' }

   use { 'neovim/nvim-lspconfig' }
   use { 'tami5/lspsaga.nvim' }
   use { 'hrsh7th/cmp-nvim-lsp' }
   use { 'hrsh7th/cmp-buffer' }
   use { 'hrsh7th/cmp-path' }
   use { 'hrsh7th/cmp-cmdline' }
   use { 'saadparwaiz1/cmp_luasnip' }
   use { 'hrsh7th/nvim-cmp' }
   use { 'ray-x/lsp_signature.nvim' }
   use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
   use { 'windwp/nvim-autopairs' }
   use { 'windwp/nvim-ts-autotag' }
   use { 'williamboman/nvim-lsp-installer' }
   use { 'jose-elias-alvarez/null-ls.nvim' }

   use { 'mfussenegger/nvim-dap-python', requires = 'mfussenegger/nvim-dap' }
   use { 'rcarriga/nvim-dap-ui', requires = 'mfussenegger/nvim-dap' }
   use { 'theHamsta/nvim-dap-virtual-text', requires =  { 'mfussenegger/nvim-dap', 'nvim-treesitter/nvim-treesitter' } }

   use { 'numToStr/Comment.nvim' }
   use { 'L3MON4D3/LuaSnip' }
   use { 'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}
   use { 'editorconfig/editorconfig-vim' }
   use { 'lewis6991/gitsigns.nvim' }
   use { 'tpope/vim-fugitive' }
   use { 'akinsho/toggleterm.nvim' }
   use { 'folke/tokyonight.nvim' }
   use { 'feline-nvim/feline.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
   use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
   use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
   use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install' }
end)
