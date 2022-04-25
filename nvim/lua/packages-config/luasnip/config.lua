local ls = require('luasnip')
local types = require('luasnip.util.types')
local inoremap = require('util').inoremap

ls.config.set_config
{
   history = true,
   updateevents = 'TextChanged,TextChangedI',
   enable_autosnippets = true,
   ext_opts =
   {
      [types.choiceNode] =
      {
         active =
         {
            virt_text = { { '<-', 'Error' } }
         }
      }
   }
}

inoremap('<C-e>', function()
   if ls.expandable() then
      ls.expand()
   end
end)

inoremap('<Tab>', function()
   if ls.jumpable(1) then
      ls.jump(1)
   end
end)

inoremap('<S-Tab>', function()
   if ls.jumpable(-1) then
      ls.jump(-1)
   end
end, { silent = true })

inoremap('<C-c>', function()
   if ls.choice_active() then
      ls.change_choice(1)
   end
end)

