local capabilities = require('cmp_nvim_lsp').default_capabilities()
return {
	cmd = {
		"vscode-eslint-language-server",
		"--stdio",
	},
	capabilities = capabilities,
	root_markers = {
		'.eslintrc',
		'.eslintrc.js',
		'.eslintrc.cjs',
		'.eslintrc.yaml',
		'.eslintrc.yml',
		'.eslintrc.json',
		'eslint.config.js',
		'eslint.config.mjs',
		'eslint.config.cjs',
		'eslint.config.ts',
		'eslint.config.mts',
		'eslint.config.cts',
	},
	filetypes = {
		'javascript',
		'javascriptreact',
		'javascript.jsx',
		'typescript',
		'typescriptreact',
		'typescript.tsx',
		'vue',
		'svelte',
		'astro',
	},
	settings = {
		validate = 'on',
		packageManager = nil,
		useESLintClass = false,
		experimental = {
			useFlatConfig = false,
		},
		codeActionOnSave = {
			enable = false,
			mode = 'all',
		},
		format = true,
		quiet = false,
		onIgnoredFiles = 'off',
		rulesCustomizations = {},
		run = 'onType',
		problems = {
			shortenToSingleLine = false,
		},
		-- nodePath configures the directory in which the eslint server should start its node_modules resolution.
		-- This path is relative to the workspace folder (root dir) of the server instance.
		nodePath = '',
		-- use the workspace folder location or the file location (if no workspace folder is open) as the working directory
		workingDirectory = { mode = 'location' },
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = 'separateLine',
			},
			showDocumentation = {
				enable = true,
			},
		},
	},
	on_new_config = function(config, new_root_dir)
		-- The "workspaceFolder" is a VSCode concept. It limits how far the
		-- server will traverse the file system when locating the ESLint config
		-- file (e.g., .eslintrc).
		config.settings.workspaceFolder = {
			uri = new_root_dir,
			name = vim.fn.fnamemodify(new_root_dir, ':t'),
		}

		-- Support flat config
		if
				vim.fn.filereadable(new_root_dir .. '/eslint.config.js') == 1
				or vim.fn.filereadable(new_root_dir .. '/eslint.config.mjs') == 1
				or vim.fn.filereadable(new_root_dir .. '/eslint.config.cjs') == 1
				or vim.fn.filereadable(new_root_dir .. '/eslint.config.ts') == 1
				or vim.fn.filereadable(new_root_dir .. '/eslint.config.mts') == 1
				or vim.fn.filereadable(new_root_dir .. '/eslint.config.cts') == 1
		then
			config.settings.experimental.useFlatConfig = true
		end

		-- Support Yarn2 (PnP) projects
		local pnp_cjs = new_root_dir .. '/.pnp.cjs'
		local pnp_js = new_root_dir .. '/.pnp.js'
		if vim.loop.fs_stat(pnp_cjs) or vim.loop.fs_stat(pnp_js) then
			config.cmd = vim.list_extend({ 'yarn', 'exec' }, config.cmd)
		end
	end
}
