local cmp = require('cmp')
cmp.setup(
{
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
   },
   {
      { name = 'buffer' },
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
