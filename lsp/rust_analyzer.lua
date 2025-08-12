local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
	cmd = { 'rust_analyzer' },
	capabilities = capabilities,
	filetypes = { 'rust' },
	root_markers = { 'Cargo.toml' },
}
