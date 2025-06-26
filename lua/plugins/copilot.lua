return {
	{
		"zbirenbaum/copilot.lua",
		lazy = false,
		opts = {
			suggestion = { enabled = true, auto_trigger = true },
			panel = { enabled = false },
		},
		config = true
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end
	},
	{
		"olimorris/codecompanion.nvim",
		opts = {
			adapters = {
				copilot = function()
					return require("codecompanion.adapters").extend("copilot", {
						schema = {
							model = {
								default = "claude-3.7-sonnet"
							}
						}
					})
				end
			},
			strategies = {
				chat = { adapter = "copilot" },
				inline = { adapter = "copilot" },
				cmd = { adapter = "copilot" },
			}
		},
		keys = {
			{ "<C-a>",      "<cmd>CodeCompanionActions<cr>",     mode = { "n", "v" }, desc = "CodeCompanion Actions popup" },
			{ "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle CodeCompanion chat" },
			{ "ga",         "<cmd>CodeCompanionChat Add<cr>",    mode = "v",          desc = "Add selection to CodeCompanion" },
		},

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
