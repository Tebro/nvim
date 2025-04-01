vim.lsp.enable({ "ts_ls", "lua_ls", "gopls", "eslint", "tailwindcss", "sqlls" })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', 'g.', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist)
vim.keymap.set('n', '<leader>Q', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>lf', function()
	vim.lsp.buf.format { async = true }
end)
