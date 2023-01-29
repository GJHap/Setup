return {
   'hrsh7th/nvim-cmp',
   config = function()
      local luasnip = require('luasnip')
      local cmp = require('cmp')

      cmp.setup({
         snippet = {
            expand = function(args)
               luasnip.lsp_expand(args.body)
            end,
         },
         formatting = {
            format = require('lspkind').cmp_format(),
         },
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
         sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
         }),
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
   end,
   dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'onsails/lspkind.nvim',
      require('plugins.luasnip'),
   },
}
