local PLUG = {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    { 'windwp/nvim-ts-autotag', event = "VeryLazy" },
    { 'HiPhish/nvim-ts-rainbow2', event = "VeryLazy" },
    { 'windwp/nvim-autopairs', event = "InsertEnter" }
  }
}

function PLUG.config()
  local rainbow = require('ts-rainbow')
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "java", "bash", "c", "html", "php", "phpdoc", "css", "javascript", "lua", "vim" },
    sync_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    autotag = {
      enable = true,
    },
    rainbow = {
      enable = true,
      disable = { 'jsx', 'cpp' },
      query = 'rainbow-parens',
      strategy = rainbow.strategy.global,
    },
    autopairs = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = {
        "python", "css"
      }
    }
  }
end

return PLUG
