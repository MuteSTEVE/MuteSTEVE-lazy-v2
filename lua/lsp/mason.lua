local PLUG = {
  'williamboman/mason.nvim',
  lazy = true,
  cmd = "Mason",
  dependencies = 'williamboman/mason-lspconfig.nvim',
}

function PLUG.config()
  local mason = require("mason")
  local masonlspconfig = require("mason-lspconfig")

  local servers = {
    'html',
    'cssls',
    'cssmodules_ls',
    'unocss',
    'phpactor',
    'intelephense',
    'tsserver',
    'pylsp',
    'lua_ls',
    'vimls'
  }

  local settings = {
    ui = {
      border = "none",
      icons = {
        package_installed = "",
        package_pending = "",
        package_uninstalled = "",
      },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
  }
  mason.setup(settings)
  masonlspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
  })
end

return PLUG
