local capabilities = require('cmp_nvim_lsp').default_capabilities()
return {
	cmd = {
		"gopls",
	},
	capabilities = capabilities,
	root_markers = {
		"go.mod",
		"go.sum",
		"go.work",
		".git",
	},
	filetypes = {"go", "gomod", "gowork", "gotmpl"},
}
