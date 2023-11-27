return {
   'hiphish/rainbow-delimiters.nvim',
   lazy = true,
   event = 'BufReadPre',
   dependencies = {
      require('plugins.treesitter'),
   },
}
