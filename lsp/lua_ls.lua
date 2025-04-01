local capabilities = require('cmp_nvim_lsp').default_capabilities()
return {
	cmd = {
		"lua-language-server",
	},
	root_markers = { "luarc.json", "luarc.jsonc", ".luacheckrc", ".luacheckrc.json", ".luacheckrc.jsonc", ".git" },
	filetypes = { "lua" },
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			diagnostics = { globals = { 'vim' } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
}
