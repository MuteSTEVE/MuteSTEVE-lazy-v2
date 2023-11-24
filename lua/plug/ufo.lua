local PLUG = {
  'kevinhwang91/nvim-ufo',
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { 'kevinhwang91/promise-async', event = { "BufReadPost", "BufNewFile" }}
}

function PLUG.config()
  local ufo = require("ufo")

  vim.o.foldlevelstart = 99
  vim.o.foldenable = true

  vim.keymap.set('n', '=', "<cmd>foldopen<cr>")
  vim.keymap.set('n', '+', require('ufo').openAllFolds)
  vim.keymap.set('n', '-', "<cmd>foldclose<cr>")
  vim.keymap.set('n', '_', require('ufo').closeAllFolds)
  vim.keymap.set('n', 'zK', function ()
    local winid = ufo.peekFoldedLinesUnderCursor()
    if not winid then
      vim.lsp.buf.hover()
    end
  end)

  ufo.setup({
    provider_selector = function (bufnr, filetype, buftype)
      return { 'lsp', 'indent' }
    end
  })

  vim.cmd([[
    augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
    augroup END
  ]])
end

return PLUG
