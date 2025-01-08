local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })

	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<leader>lr', ':LspRestart<cr>', opts)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', 'g.', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
	vim.keymap.set('n', '<leader>Q', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', '<leader>lf', function()
		vim.lsp.buf.format { async = true }
	end, opts)
end)


require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})
require('mason-lspconfig').setup({
	handlers = {
		lsp_zero.default_setup,
	},
})
