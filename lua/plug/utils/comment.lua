local PLUG = {
  'terrortylor/nvim-comment',
  event = { "BufReadPost", "BufNewFile" }
}

function PLUG.config()
  local comment = require("nvim_comment")

  comment.setup({
    comment_empty = false,
    line_mapping = "gc",
    operator_mapping = "gc",
    comment_chunk_text_object = "ic"
  })
end

return PLUG
