vim.pack.add({
	-- deps
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-tree/nvim-web-devicons",

	"https://github.com/stevearc/aerial.nvim"
})

require('aerial').setup({})
vim.keymap.set("n", "<leader>AA", "<cmd>AerialToggle!<CR>")
