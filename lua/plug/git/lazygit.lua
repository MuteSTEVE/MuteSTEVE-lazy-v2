local PLUG = {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = "LazyGit",
  event = "VeryLazy",
  keys = { "<leader>g", "<cmd>LazyGit<cr>" }
}

function PLUG.config()
  vim.keymap.set("n", "<leader>g", "<cmd>LazyGit<cr>", {silent = true})
end

return PLUG
