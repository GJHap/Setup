return {
   'nvim-neorg/neorg',
   dependencies = { 'luarocks.nvim' },
   lazy = false,
   version = '*',
   config = true,
   opts = {
      load = {
         ['core.completion'] = { config = { engine = 'nvim-cmp' } },
         ['core.defaults'] = {},
         ['core.concealer'] = {},
         ['core.clipboard.code-blocks'] = {},
         ['core.esupports.hop'] = {},
         ['core.esupports.indent'] = {},
         ['core.itero'] = {},
         ['core.promo'] = {},
      },
   },
}
