local PLUG = {
  'yamatsum/nvim-cursorline',
  event = { "BufReadPost", "BufNewFile" },
}

function PLUG.config()
  local cursorline_ok, cursorline = pcall(require, 'nvim-cursorline')
  if not cursorline_ok then
    return
  end

  cursorline.setup({
    cursorline = {
      enable = false,
      timeout = 1000,
      number = false,
    },
    cursorword = {
      enable = true,
      min_length = 3,
      hl = { underline = true },
    }
  })
end

return PLUG
