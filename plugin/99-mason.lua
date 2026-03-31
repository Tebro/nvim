vim.pack.add({
	-- deps
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",

	"https://github.com/mason-org/mason-lspconfig.nvim",
})

require("mason").setup({})

require("mason-lspconfig").setup({
	automatic_enable = true
})
