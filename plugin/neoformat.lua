vim.pack.add({
	"https://github.com/sbdchd/neoformat",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.tsx", "*.ts", "*.js", "*.jsx", "*.json", "*.html", "*.css", "*.scss" },
	command = "Neoformat prettierd"
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
	command = "Neoformat gofmt"
})
