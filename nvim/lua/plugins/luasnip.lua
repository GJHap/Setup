return {
   'L3MON4D3/LuaSnip',
   config = function()
      local luasnip = require('luasnip')
      local luasnip_types = require('luasnip.util.types')
      luasnip.config.set_config({
         history = true,
         updateevents = 'TextChanged,TextChangedI',
         enable_autosnippets = true,
         ext_opts = {
            [luasnip_types.choiceNode] = {
               active = {
                  virt_text = { { '<-', 'Error' } },
               },
            },
         },
      })

      local inoremap = require('util').inoremap
      inoremap('<C-e>', function()
         if luasnip.expandable() then
            luasnip.expand()
         end
      end, { desc = 'Expand Snippet' })

      inoremap('<C-c>', function()
         if luasnip.choice_active() then
            luasnip.change_choice(1)
         end
      end, { desc = 'Choose Snippet Option' })

      local snippets = require('luasnip.loaders.from_vscode')
      snippets.lazy_load()
   end,
   dependencies = { 'saadparwaiz1/cmp_luasnip', 'rafamadriz/friendly-snippets' },
}
