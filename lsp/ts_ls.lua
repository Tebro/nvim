
local capabilities = require('cmp_nvim_lsp').default_capabilities()
return {
	cmd = {
		"typescript-language-server",
		"--stdio",
	},
	capabilities = capabilities,
	root_markers = {'package.json', 'tsconffig.json'},
	filetypes = {"typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx"},
}
