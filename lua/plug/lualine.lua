local PLUG = {
  'nvim-lualine/lualine.nvim',
  dependencies = 'kyazdani42/nvim-web-devicons',
  event = { "BufReadPost", "BufNewFile", "InsertEnter" },
  config = function()
    vim.cmd("set laststatus=3")
  end
}

function PLUG.config()
  local lualine = require("lualine")
  local icons = require('core.icons')

  local ic = icons.chars
  local progress_bar = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { ic.__1, ic.__2, ic.__3, ic.__4, ic.__5, ic.__6, ic.__7, ic.__8, ic.__9 }
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
    symbols = { error = icons.signs.Error, warn = icons.signs.Warn, info = icons.signs.Info },
  }
end

return PLUG
