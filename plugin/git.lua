
vim.pack.add({
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/nvim-mini/mini.diff",
})

vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
require('mini.diff').setup()
