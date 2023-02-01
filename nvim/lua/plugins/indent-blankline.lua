return {
   'lukas-reineke/indent-blankline.nvim',
   lazy = true,
   event = 'BufReadPre',
   init = function()
      vim.opt.list = true
      vim.opt.listchars:append('space:⋅')
   end,
   config = true,
   opts = {
      show_current_context = true,
      show_current_context_start = true,
   },
}
