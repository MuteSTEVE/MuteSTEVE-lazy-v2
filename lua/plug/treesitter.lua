local PLUG = {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    { 'windwp/nvim-ts-autotag',  event = { "BufReadPost", "BufNewFile" }, },
    { 'windwp/nvim-autopairs', event = { "BufReadPost", "BufNewFile" }, }
  }
}

function PLUG.config()
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
