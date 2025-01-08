return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function ()
		require("codecompanion").setup({
			adapters = {
				copilot = function ()
					return require("codecompanion.adapters").extend("copilot", {
						schema = {
							model = {
								default = "claude-3.5-sonnet"
							}
						}
					})
				end
			},
			strategies = {
				chat = { adapter = "copilot" },
				inline = { adapter = "copilot" },
			}
		})
  end
}
