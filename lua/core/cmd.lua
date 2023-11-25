-- colorscheme
vim.cmd('colorscheme onedark')

-- global status
vim.cmd("set laststatus=3")

-- cmp transparent
vim.cmd("highlight Pmenu guibg=NONE")

-- ufo to remember_folds
vim.cmd([[
  augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
  augroup END
]])

-- lazygit
vim.cmd("autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()")
