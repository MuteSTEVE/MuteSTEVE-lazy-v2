local PLUG = {
  'williamboman/mason.nvim',
  lazy = true,
  cmd = "Mason",
  dependencies = 'williamboman/mason-lspconfig.nvim',
}

function PLUG.config()
  local mason_ok, mason = pcall(require, "mason")
  if not mason_ok then
    return
  end
  local masonlspconfig_ok, masonlspconfig = pcall(require, "mason-lspconfig")
  if not masonlspconfig_ok then
    return
  end

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

  local icons_ok, icons = pcall(require, "core.icons")
  if not icons_ok then
    return
  end
  local im = icons.mason
  local settings = {
    ui = {
      border = "none",
      icons = {
        package_installed = im.package_installed,
        package_pending = im.package_pending,
        package_uninstalled = im.package_uninstalled,
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
