local prequire = require('util').prequire

prequire('surround', function(surround)
   surround.setup
   {
      mapping_style = 'sandwich',
      prefix = '<Leader>s',
      prompt = false,
      space_on_closing_char = true,
   }
end)
