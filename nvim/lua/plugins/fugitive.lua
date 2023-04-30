return {
   'tpope/vim-fugitive',
   init = function()
      local nnoremap = require('util').nnoremap

      nnoremap('<Leader>ga', ':Git add .<CR>', { desc = 'Git Add' })
      nnoremap('<Leader>gs', ':Git status <CR>', { desc = 'Git Status' })
      nnoremap('<Leader>gb', ':Git blame <CR>', { desc = 'Git Blame' })
      nnoremap('<Leader>gl', ':Git log <CR>', { desc = 'Git Log' })
      nnoremap('<Leader>gh', ':Git pull <CR>', { desc = 'Git Pull' })
      nnoremap('<Leader>gl', ':Git push <CR>', { desc = 'Git Push' })
      nnoremap('<Leader>gc', ':Git commit --no-verify <CR>', { desc = 'Git Commit' })
   end,
}
