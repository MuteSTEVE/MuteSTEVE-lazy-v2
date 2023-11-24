local PLUG = {
  'nvim-lualine/lualine.nvim',
  dependencies = 'kyazdani42/nvim-web-devicons',
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    vim.cmd("set laststatus=3")
  end
}

function PLUG.config()
  local lualine = require("lualine")
  local icon = require('core.icon')

  local progress_bar = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { icon.chars.__1, icon.chars.__2, icon.chars.__3, icon.chars.__4, icon.chars.__5, icon.chars.__6, icon.chars.__7, icon.chars.__8, icon.chars.__9 }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end

  lualine.setup {
    options = {
      icons_enabled = true,
      theme = 'onedark',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      transparent = true,
    },
    sections = {
      lualine_a = {'filename',},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_x = {
        'encoding',
        'fileformat',
        'filetype',
      },
      lualine_y = {'progress'},
      lualine_z = {progress_bar}
    },
    inactive_sections = {
      lualine_c = {'filename'},
      lualine_x = {'location'},
    },
    sources = { 'nvim_diagnostic' },
    symbols = { error = icon.signs.Error, warn = icon.signs.Warn, info = icon.signs.Info },
  }
end

return PLUG
