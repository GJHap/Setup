local cmp = require('cmp')
cmp.setup(
{
   snippet =
   {
      expand = function(args)
         require('luasnip').lsp_expand(args.body)
      end,
   },
   mapping =
   {
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm()
   },
   sources = cmp.config.sources(
   {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'luasnip' }
   })
})

cmp.setup.cmdline('/',
{
   sources =
   {
      { name = 'buffer' }
   }
})

cmp.setup.cmdline(':',
{
   sources = cmp.config.sources(
   {
      { name = 'path' }
   },
   {
      { name = 'cmdline' }
   })
})
