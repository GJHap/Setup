local util = require('util')
local prequire = util.prequire
local inoremap = util.inoremap

prequire('luasnip', function(luasnip)
   local ext_opts = {}
   prequire('luasnip.util.types', function(luasnip_types)
      ext_opts =
      {
         [luasnip_types.choiceNode] =
         {
            active =
            {
               virt_text = { { '<-', 'Error' } }
            }
         }
      }
   end)

   luasnip.config.set_config
   {
      history = true,
      updateevents = 'TextChanged,TextChangedI',
      enable_autosnippets = true,
      ext_opts = ext_opts
   }

   inoremap('<C-e>', function()
      if luasnip.expandable() then
         luasnip.expand()
      end
   end)

   inoremap('<Tab>', function()
      if luasnip.jumpable(1) then
         luasnip.jump(1)
      else
         return '<Tab>'
      end
   end, { expr = true })

   inoremap('<S-Tab>', function()
      if luasnip.jumpable(-1) then
         luasnip.jump(-1)
      end
   end)

   inoremap('<C-c>', function()
      if luasnip.choice_active() then
         luasnip.change_choice(1)
      end
   end)
end)
