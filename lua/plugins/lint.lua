return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				--lua = { "luacheck" },
				--rust = { "cargo" },
				python = { "ruff" },
				--javascript = { "eslint_d" },
				--typescript = { "eslint_d" },
		 		--typescriptreact = { "eslint_d" },
				--javascriptreact = { "eslint_d" },
				vue = { "eslint_d" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	}
}
