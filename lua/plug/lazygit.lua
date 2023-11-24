local PLUG = {
  "kdheepak/lazygit.nvim",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  keys = { "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit"}
}

function PLUG.config()
  vim.cmd("autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()")
end

return PLUG
