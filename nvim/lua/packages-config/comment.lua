local prequire = require('util').prequire

prequire('Comment', function(comment)
   comment.setup
   {
      toggler =
      {
         line = '<Leader>clt',
         block = '<Leader>cbt'
      },
      opleader =
      {
         line = '<Leader>cl',
         block = '<Leader>cb'
      },
      extra =
      {
         above = '<Leader>clO',
         below = '<Leader>clo',
         eol = '<Leader>clA'
      }
   }
end)
