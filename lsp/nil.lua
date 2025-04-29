local capabilities = require('cmp_nvim_lsp').default_capabilities()
	return {
		cmd = { 'nil' },
		capabilities = capabilities,
		filetypes = { 'nix' },
		root_markers = { 'flake.nix', '.git' },
		settings =  {
			["nil"] = {
			formatting = {
				command = { "nixfmt" }
			}
		}
	},

}
