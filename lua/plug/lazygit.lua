local PLUG = {
  "kdheepak/lazygit.nvim",
  lazy = true,
  event = "VeryLazy",
  keys = { "<leader>g", "<cmd>LazyGit<cr>" }
}

function PLUG.config()
  vim.cmd("autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()")
  vim.keymap.set("n", "<leader>g", "<cmd>LazyGit<cr>", {silent = true})
end

return PLUG
