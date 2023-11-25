local PLUG = {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'kyazdani42/nvim-web-devicons',
  lazy = true,
  event = "VeryLazy",
  keys = { "<leader>n", "<cmd>NvimTreeFindFileToggle<cr>" }
}

function PLUG.config()
  local nvimtree = require("nvim-tree")
  local icons = require('core.icons')
  local inv = icons.nvimtree
  local igit = icons.git

  nvimtree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 30,
      side = "left",
      number = false,
      relativenumber = false,
    },
    renderer = {
      indent_markers = { enable = true },
      root_folder_modifier = ":t",
      highlight_git = true,
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = false,
          git = true,
        },
        glyphs = {
          default = inv.GlyphDefault,
          symlink = inv.GlyphSymlink,
          git = {
            unstaged = igit.unstaged,
            staged = igit.staged,
            unmerged = igit.unmerged,
            renamed = igit.renamed,
            deleted = igit.deleted,
            untracked = igit.untracked,
            ignored = igit.ignored,
          },
          folder = {
            default = inv.default,
            open = inv.open,
            empty = inv.empty,
            empty_open = inv.empty_open,
            symlink = inv.symlink,
          },
        }
      }
    }
  }

  vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeFindFileToggle<cr>", {silent = true})
end

return PLUG
