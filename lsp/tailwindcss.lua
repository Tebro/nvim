local capabilities = require('cmp_nvim_lsp').default_capabilities()
return {
	cmd = {
		"tailwindcss-language-server",
		"--stdio",
	},
	capabilities = capabilities,
	root_markers = {
		'tailwind.config.js',
		'tailwind.config.cjs',
		'tailwind.config.mjs',
		'tailwind.config.ts',
		'postcss.config.js',
		'postcss.config.cjs',
		'postcss.config.mjs',
		'postcss.config.ts',
	},
	filetypes = {
		'aspnetcorerazor',
		'astro',
		'astro-markdown',
		'blade',
		'clojure',
		'django-html',
		'htmldjango',
		'edge',
		'eelixir', -- vim ft
		'elixir',
		'ejs',
		'erb',
		'eruby', -- vim ft
		'gohtml',
		'gohtmltmpl',
		'haml',
		'handlebars',
		'hbs',
		'html',
		'htmlangular',
		'html-eex',
		'heex',
		'jade',
		'leaf',
		'liquid',
		'markdown',
		'mdx',
		'mustache',
		'njk',
		'nunjucks',
		'php',
		'razor',
		'slim',
		'twig',
		-- css
		'css',
		'less',
		'postcss',
		'sass',
		'scss',
		'stylus',
		'sugarss',
		-- js
		'javascript',
		'javascriptreact',
		'reason',
		'rescript',
		'typescript',
		'typescriptreact',
		-- mixed
		'vue',
		'svelte',
		'templ',
	},
	settings = {
		tailwindCSS = {
			validate = true,
			lint = {
				cssConflict = 'warning',
				invalidApply = 'error',
				invalidScreen = 'error',
				invalidVariant = 'error',
				invalidConfigPath = 'error',
				invalidTailwindDirective = 'error',
				recommendedVariantOrder = 'warning',
			},
			classAttributes = {
				'class',
				'className',
				'class:list',
				'classList',
				'ngClass',
			},
			includeLanguages = {
				eelixir = 'html-eex',
				eruby = 'erb',
				templ = 'html',
				htmlangular = 'html',
			},
		},
	},
	on_new_config = function(new_config)
		if not new_config.settings then
			new_config.settings = {}
		end
		if not new_config.settings.editor then
			new_config.settings.editor = {}
		end
		if not new_config.settings.editor.tabSize then
			-- set tab size for hover
			new_config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
		end
	end,
}
