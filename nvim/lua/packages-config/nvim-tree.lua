require('nvim-tree').setup(
{
   view =
   {
      mappings =
      {
         list =
         {
            { key = '<Leader>sr', action = 'split' },
            { key = '<Leader>sc', action = 'vsplit' }
         }
      }
   }
})
