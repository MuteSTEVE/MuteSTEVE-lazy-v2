local PLUG = {
  'windwp/nvim-autopairs',
  event = { "BufReadPost", "BufNewFile" },
}

function PLUG.config()
  local autopairs = require("nvim-autopairs")
  local cmp = require("cmp")
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

  autopairs.setup {
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  }
end

return PLUG
