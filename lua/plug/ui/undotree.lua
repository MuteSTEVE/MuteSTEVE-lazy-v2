return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  keys = { -- load the plugin only when using it's keybinding:
    { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
  },
}
