return {
   'nvim-treesitter/nvim-treesitter',
   lazy = true,
   event = 'BufReadPre',
   config = function()
      require('nvim-treesitter.configs').setup({
         auto_install = true,
         highlight = {
            enable = true,
         },
         rainbow = {
            enable = true,
         },
         autotag = {
            enable = true,
         },
         textobjects = {
            select = {
               enable = true,
               lookahead = true,

               keymaps = {
                  ['aa'] = '@attribute.outer',
                  ['ia'] = '@attribute.inner',
                  ['ab'] = '@block.outer',
                  ['ib'] = '@block.inner',
                  ['aC'] = '@class.outer',
                  ['iC'] = '@class.inner',
                  ['ac'] = '@conditional.outer',
                  ['ic'] = '@conditional.inner',
                  ['af'] = '@function.outer',
                  ['if'] = '@function.inner',
                  ['al'] = '@loop.outer',
                  ['il'] = '@loop.inner',
                  ['ap'] = '@parameter.outer',
                  ['ip'] = '@parameter.inner',
               },
            },
         },
      })
   end,
   dependencies = {
      'HiPhish/nvim-ts-rainbow2',
      'windwp/nvim-autopairs',
      'windwp/nvim-ts-autotag',
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-treesitter-textobjects',
   },
   build = ':TSUpdate',
}
