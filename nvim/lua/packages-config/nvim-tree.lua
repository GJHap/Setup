local prequire = require('util').prequire

prequire('nvim-tree', function(nvim_tree)
  nvim_tree.setup({
    view = {
      mappings = {
        list = {
          { key = '<Leader>sr', action = 'split' },
          { key = '<Leader>sc', action = 'vsplit' },
        },
      },
    },
    update_focused_file = { enable = true },
    hijack_directories = { enable = false },
  })

  local nnoremap = require('util').nnoremap
  nnoremap('<Leader>tt', nvim_tree.toggle)
end)
