local actions = require('telescope.actions')

require('telescope').setup
{
   defaults =
   {
      mappings =
      {
         n =
         {
            ["<Leader>sc"] = actions.select_vertical,
            ["<Leader>sr"] = actions.select_horizontal
         }
      }
   }
}
