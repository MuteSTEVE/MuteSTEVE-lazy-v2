local PLUG = {
  'nvim-telescope/telescope.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  lazy = true,
  cmd = "Telescope",
}

function PLUG.config()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local icons = require('core.icons')
  local it = icons.telescope

  telescope.setup {
    defaults = {
      prompt_prefix = it.find .. " ",
      selection_caret = it.select .. " ",
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-f>"] = actions.close,
          ["<leader>b"] = actions.close,
          ["<leader>u"] = actions.close,
          ["<esc>"] = actions.close,
        },
      },
    }
  }
end

return PLUG
