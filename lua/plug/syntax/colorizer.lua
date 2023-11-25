local PLUG = {
  'norcalli/nvim-colorizer.lua',
  event = { "BufReadPost", "BufNewFile" },
  ft = { "css", "html", "php", "js", },
}

function PLUG.config()
    require('colorizer').setup()
end

return PLUG
