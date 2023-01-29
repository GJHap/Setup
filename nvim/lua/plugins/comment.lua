return {
   'numToStr/Comment.nvim',
   lazy = true,
   event = 'BufReadPre',
   config = function()
      require('Comment').setup({
         toggler = {
            line = '<Leader>clt',
            block = '<Leader>cbt',
         },
         opleader = {
            line = '<Leader>cl',
            block = '<Leader>cb',
         },
         extra = {
            above = '<Leader>clO',
            below = '<Leader>clo',
            eol = '<Leader>clA',
         },
      })
   end,
}
