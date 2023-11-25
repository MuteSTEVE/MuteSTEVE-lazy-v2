local PLUG = {
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
}

function PLUG.config()
  local status_ok, onedark = pcall(require, 'onedark')
  if not status_ok then
    return
  end

  onedark.setup({
    style = 'warmer',
    transparent = true,
    code_style = {
      comments = 'italic',
    },
    lualine = {
      transparent = true, -- lualine center bar transparency
    },
    diagnostics = {
      darker = true, -- darker colors for diagnostic
      undercurl = true,   -- use undercurl instead of underline for diagnostics
      background = true,    -- use background color for virtual text
    },
  })

  onedark.load()
end

return PLUG
