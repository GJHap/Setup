local prequire = require('util').prequire

prequire('cmp', function(cmp)
   local sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
   }

   local snippet = {}
   prequire('luasnip', function(luasnip)
      table.insert(sources, 1, { name = 'luasnip' })
      snippet = {
         expand = function(args)
            luasnip.lsp_expand(args.body)
         end,
      }
   end)

   local formatting = {}
   prequire('lspkind', function(lspkind)
      formatting = {
         format = lspkind.cmp_format(),
      }
   end)

   cmp.setup({
      snippet = snippet,
      formatting = formatting,
      mapping = {
         ['<Tab>'] = cmp.mapping.select_next_item(),
         ['<S-Tab>'] = cmp.mapping.select_prev_item(),
         ['<C-Space>'] = cmp.mapping.complete(),
         ['<C-e>'] = cmp.mapping.close(),
         ['<CR>'] = cmp.mapping.confirm(),
      },
      sources = cmp.config.sources(sources),
   })

   cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
         { name = 'buffer' },
      }),
   })

   cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
         { name = 'path' },
         { name = 'cmdline' },
      }),
   })
end)
