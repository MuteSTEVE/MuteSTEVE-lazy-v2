local PLUG = {
  'nvim-lualine/lualine.nvim',
  dependencies = 'kyazdani42/nvim-web-devicons',
  event = { "BufReadPost", "BufNewFile", "InsertEnter" },
}

function PLUG.config()
  local lualine = require("lualine")
  local icons = require('core.icons')

  local ic = icons.lualine
  local progress_bar = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { ic.__1, ic.__2, ic.__3, ic.__4, ic.__5, ic.__6, ic.__7, ic.__8, ic.__9 }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end

  local mode_map = {
    ['NORMAL'] = ' NORMAL',
    ['O-PENDING'] = ' 0-PENDING',
    ['INSERT'] = ' INSERT',
    ['VISUAL'] = ' VISUAL',
    ['V-BLOCK'] = ' V-BLOCK',
    ['V-LINE'] = ' V-LINE',
    ['V-REPLACE'] = ' V-REPLACE',
    ['REPLACE'] = ' REPLACE',
    ['COMMAND'] = ' COMMAND',
    ['SHELL'] = ' SHELL',
    ['TERMINAL'] = ' TERMINAL',
    ['EX'] = ' EX',
    ['S-BLOCK'] = ' S-BLOCK',
    ['S-LINE'] = ' S-LINE',
    ['SELECT'] = ' SELECT',
    ['CONFIRM'] = ' CONFIRM',
    ['MORE'] = ' MORE',
  }

  local is = icons.signs
  lualine.setup {
    options = {
      icons_enabled = true,
      theme = 'onedark',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      transparent = true,
    },
    sections = {
      lualine_a = { {'mode', fmt = function(s) return mode_map[s] or s end} },
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_x = {
        'encoding',
        'fileformat',
        'filetype',
      },
      lualine_y = {'progress'},
      lualine_z = {progress_bar}
    },
    sources = { 'nvim_diagnostic' },
    symbols = { error = is.Error, warn = is.Warn, info = is.Info },
  }
end

return PLUG
