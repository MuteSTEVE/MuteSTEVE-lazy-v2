local PLUG = {
  'echasnovski/mini.nvim',
  event = { "BufReadPost", "BufNewFile" },
}

function PLUG.config()
  require('mini.indentscope').setup()
end

return PLUG
