require('feline').setup
{
   theme = require('tokyonight.colors').setup{},
   components =
   {
      active =
      {
         {
            {
               provider = 'vi_mode',
               icon = '',
               left_sep = 'slant_left',
               right_sep = 'slant_right_2',
               hl =
               {
                  bg = 'dark3',
               }
            },
            {
               provider = "file_info",
               left_sep = 'slant_left',
               right_sep = 'slant_right_2',
               opts =
               {
                  type = 'base-only'
               },
               hl =
               {
                  bg = 'blue0'
               }
            },
            {
               provider = 'diagnostic_errors',
               hl =
               {
                  fg = 'red'
               }
            },
            {
               provider = 'diagnostic_warnings',
               hl =
               {
                  fg = 'yellow'
               }
            },
            {
               provider = 'diagnostic_hints',
               hl =
               {
                  fg = 'dark3'
               }
            },
         },
         {
            {
               provider = 'file_format',
               left_sep = 'slant_left',
               right_sep = 'slant_right_2',
               hl =
               {
                  bg = 'dark3'
               }
            }, 
            {
               provider = 'file_encoding',
               left_sep = 'slant_left',
               right_sep = 'slant_right_2',
               hl =
               {
                  bg = 'blue0'
               }
            },
            {
               provider = 'position',
               left_sep = 'slant_left',
               right_sep = 'slant_right_2',
               hl =
               {
                  bg = 'dark3'
               }
            },
            {
               provider = 'line_percentage',
               left_sep = 'slant_left',
               right_sep = 'slant_right_2',
               hl =
               {
                  bg = 'blue0'
               }
            },
         }
      },
      inactive =
      {
         {
            {
               provider = 'file_info',
               left_sep = 'slant_left',
               right_sep = 'slant_right_2',
               opts =
               {
                  type = 'base-only'
               },
               hl =
               {
                  bg = 'blue0'
               }
            }
         },
         {
         }
      }
   }
}
