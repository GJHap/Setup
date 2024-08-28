return {
   'windwp/nvim-autopairs',
   event = 'InsertEnter',
   config = true,
   dependencies = {
      require('plugins.treesitter'),
   },
}
