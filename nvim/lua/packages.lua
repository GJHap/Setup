local prequire = require('util').prequire

prequire('packer', function(packer)
   packer.startup(function(use)
      use({ 'wbthomason/packer.nvim' })

      use({ 'neovim/nvim-lspconfig' })
      use({ 'tami5/lspsaga.nvim' })
      use({ 'hrsh7th/nvim-cmp' })
      use({ 'hrsh7th/cmp-nvim-lsp' })
      use({ 'hrsh7th/cmp-buffer' })
      use({ 'hrsh7th/cmp-path' })
      use({ 'hrsh7th/cmp-cmdline' })
      use({ 'saadparwaiz1/cmp_luasnip' })
      use({ 'onsails/lspkind.nvim' })
      use({ 'ray-x/lsp_signature.nvim' })
      use({ 'williamboman/mason.nvim' })
      use({ 'williamboman/mason-lspconfig.nvim' })
      use({ 'jose-elias-alvarez/null-ls.nvim' })

      use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
      use({ 'p00f/nvim-ts-rainbow', requires = 'nvim-treesitter/nvim-treesitter' })
      use({ 'windwp/nvim-autopairs', requires = 'nvim-treesitter/nvim-treesitter' })
      use({ 'windwp/nvim-ts-autotag', requires = 'nvim-treesitter/nvim-treesitter' })
      use({ 'folke/tokyonight.nvim', requires = 'nvim-treesitter/nvim-treesitter' })

      use({ 'mfussenegger/nvim-dap' })
      use({ 'mfussenegger/nvim-dap-python', requires = 'mfussenegger/nvim-dap' })
      use({ 'rcarriga/nvim-dap-ui', requires = 'mfussenegger/nvim-dap' })
      use({
         'theHamsta/nvim-dap-virtual-text',
         requires = { 'mfussenegger/nvim-dap', 'nvim-treesitter/nvim-treesitter' },
      })

      use({
         'nvim-neotest/neotest',
         requires = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'antoinemadec/FixCursorHold.nvim',
         },
      })
      use({ 'haydenmeade/neotest-jest', requires = 'nvim-neotest/neotest' })

      use({ 'akinsho/bufferline.nvim', tag = '*', requires = 'kyazdani42/nvim-web-devicons' })
      use('tiagovla/scope.nvim')
      use('famiu/bufdelete.nvim')

      use({ 'ggandor/leap.nvim' })
      use({ 'lukas-reineke/indent-blankline.nvim' })
      use({ 'numToStr/Comment.nvim' })
      use({ 'kylechui/nvim-surround' })
      use({ 'L3MON4D3/LuaSnip' })
      use({ 'editorconfig/editorconfig-vim' })
      use({ 'lewis6991/gitsigns.nvim' })
      use({ 'tpope/vim-fugitive' })
      use({ 'akinsho/toggleterm.nvim' })
      use({ 'feline-nvim/feline.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
      use({ 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' })
      use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
      use({ 'iamcco/markdown-preview.nvim', run = 'cd app && npm install' })
      use({ 'anuvyklack/hydra.nvim' })
   end)
end)
