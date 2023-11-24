local PLUG = {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'kyazdani42/nvim-web-devicons',
  lazy = true,
  cmd = "NvimTree",
  keys = { "<leader>n", "<cmd>NvimTeeFindFileToggle<cr>", desc = "Nvimtree" }
}

function PLUG.config()
  local nvimtree = require("nvim-tree")
  local icon = require('core.icon')

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
          default = icon.nvimtree.GlyphDefault,
          symlink = icon.nvimtree.GlyphSymlink,
          git = {
            unstaged = icon.git.unstaged,
            staged = icon.git.staged,
            unmerged = icon.git.unmerged,
            renamed = icon.git.renamed,
            deleted = icon.git.deleted,
            untracked = icon.git.untracked,
            ignored = icon.git.ignored,
          },
          folder = {
            default = icon.nvimtree.default,
            open = icon.nvimtree.open,
            empty = icon.nvimtree.empty,
            empty_open = icon.nvimtree.empty_open,
            symlink = icon.nvimtree.symlink,
          },
        }
      }
    }
  }
end

return PLUG
