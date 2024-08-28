return {
   'nvim-treesitter/nvim-treesitter',
   lazy = true,
   event = 'BufReadPre',
   config = true,
   main = 'nvim-treesitter.configs',
   opts = {
      auto_install = true,
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
   },
   dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
   },
   build = ':TSUpdate',
}
