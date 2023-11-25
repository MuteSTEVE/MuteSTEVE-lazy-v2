local PLUG = {
  'norcalli/nvim-colorizer.lua',
  cmd = "Colorizer",
  event = { "BufReadPost", "BufNewFile" },
  ft = { "css", "html", "php", "js", },
}

function PLUG.config()
  local colorizer_ok, colorizer = pcall(require, "colorizer")
  if not colorizer_ok then
    return
  end

  colorizer.setup()
end

return PLUG
