return {
  'yamatsum/nvim-cursorline',
  event = { "BufReadPost", "BufNewFile" },
  {
    {
      'norcalli/nvim-colorizer.lua',
      event = { "BufReadPost", "BufNewFile" },
      ft = { "css", "html", "php", "js", },
      config = function()
        require('colorizer').setup()
      end
    },
  }
}
