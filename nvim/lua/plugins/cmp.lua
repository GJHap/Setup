return {
   'hrsh7th/nvim-cmp',
   config = function()
      local cmp = require('cmp')

      cmp.setup({
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
               else
                  fallback()
               end
            end, { 'i' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
               if cmp.visible() then
                  cmp.select_prev_item()
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
            { name = 'buffer' },
         }),
      })

      cmp.setup.cmdline('/', {
         mapping = cmp.mapping.preset.cmdline(),
         sources = cmp.config.sources({
            { name = 'buffer' },
         }),
      })
   end,
   dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'onsails/lspkind.nvim',
   },
}
