local capabilities = require('cmp_nvim_lsp').default_capabilities()
return {
	cmd = {
		"sql-language-server",
		"up",
		"--method",
		"stdio",
	},
	capabilities = capabilities,
	root_markers = { ".sqllsrc.json" },
	filetypes = { "sql", "mysql", },
}
