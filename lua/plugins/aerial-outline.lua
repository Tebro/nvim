return {
	'stevearc/aerial.nvim',
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		require('aerial').setup({})
		-- You probably also want to set a keymap to toggle aerial
		vim.keymap.set("n", "<leader>aa", "<cmd>AerialToggle!<CR>")
		vim.keymap.set("n", "<leader>aA", "<cmd>Telescope aerial<CR>")
	end
}
