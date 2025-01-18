
return {
  {
    "github/copilot.vim"
  },
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "github/copilot.vim" },
		},
		opts = {
			debug = true,
			model = "claude-3.5-sonnet"
		}
	}
}
