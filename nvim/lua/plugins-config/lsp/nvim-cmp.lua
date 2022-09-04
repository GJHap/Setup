local prequire = require('util').prequire

prequire('cmp', function(cmp)
   local sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
   }

   local snippet = {}
   local luasnip
   prequire('luasnip', function(_luasnip)
      luasnip = _luasnip
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
         ['<C-d>'] = function()
            for _ = 1, 10 do
               cmp.mapping.select_next_item()(nil)
            end
         end,
         ['<C-u>'] = function()
            for _ = 1, 10 do
               cmp.mapping.select_prev_item()(nil)
            end
         end,
         ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
               cmp.select_next_item()
            elseif luasnip and luasnip.jumpable(1) then
               luasnip.jump(1)
            else
               fallback()
            end
         end, { 'i' }),
         ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
               cmp.select_prev_item()
            elseif luasnip and luasnip.jumpable(-1) then
               luasnip.jump(-1)
            else
               fallback()
            end
         end, { 'i' }),
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
