vim.opt.list = true
vim.opt.listchars:append('space:⋅')

local prequire = require('util').prequire
prequire('indent_blankline', function(indent_blankline)
  indent_blankline.setup({
    show_current_context = true,
    show_current_context_start = true,
  })
end)
