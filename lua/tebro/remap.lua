-- <leader> is space
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- use fd to get out of insert mode in files and terminal
vim.keymap.set('t', 'fd', '<C-\\><C-n>')
vim.keymap.set('i', 'fd', '<Esc>')
vim.keymap.set('v', 'fd', '<Esc>')

-- nice save shortcut
vim.keymap.set('n', '<leader>w', vim.cmd.update)
-- Edit this file
vim.keymap.set('n', '<leader>fe', ':e $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>fE', ':cd ~/.config/nvim<cr>')

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
-- Paste from system
vim.keymap.set('n', '<leader>p', '"+p')

-- Visual mode move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Find/Replace for symbol under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left><Left>]])
-- Find/Replace for selection in buffer
vim.keymap.set("v", "<leader>s", [[y:%s/\<<C-r>0\>/<C-r>0/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>S", [[y:%s/\<<C-r>0\>/<C-r>0/gcI<Left><Left><Left><Left>]])

-- Join lines, maintain cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Maintain center when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set('n', '<leader>e', function()
	vim.cmd.edit(vim.fn.getcwd())
end)
-- open dir of current file
vim.keymap.set('n', '<leader>E', vim.cmd.Oil)

-- clear highlight
vim.keymap.set('n', '<leader><return>', ':noh<cr>')

-- Maximize window
vim.keymap.set('n', '<C-W>m', '<C-W>|<C-W>_')

-- New tab terminal
vim.keymap.set('n', '<leader>tT', ':tabnew +terminal<cr>')

vim.keymap.set('n', '<leader>rl', ':checktime<cr>')

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
