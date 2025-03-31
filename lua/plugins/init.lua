return {
  "tpope/vim-surround",
	{
		"sbdchd/neoformat",
		config = function ()
			vim.api.nvim_create_autocmd("BufWritePre",{
				pattern = { "*.tsx", "*.ts", "*.js", "*.jsx", "*.json", "*.html", "*.css", "*.scss" },
				command = "Neoformat prettier"
			})
			vim.api.nvim_create_autocmd("BufWritePre",{
				pattern = {"*.go"},
				command = "Neoformat gofmt"
			})
		end
	},
}
