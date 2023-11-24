local PLUG = {
  'lewis6991/gitsigns.nvim',
  event = { "BufReadPost", "BufNewFile" }
}

function PLUG.config()
  local gitsigns = require("gitsigns")
  local icons = require('core.icons')
  local igit = icons.git

  gitsigns.setup {
    signs = {
      add = { hl = "GitSignsAdd", text = igit.signs, numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = { hl = "GitSignsChange", text = igit.signs, numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      delete = { hl = "GitSignsDelete", text = igit.signs, numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      topdelete = { hl = "GitSignsDelete", text = igit.signs, numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      changedelete = { hl = "GitSignsChange", text = igit.signs, numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
  }
end

return PLUG
