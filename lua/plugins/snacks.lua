return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			animate = { enabled = true },
			picker = { enabled = true },
			explorer = { enabled = true },
		},
		keys = {
			{ "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
			{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
			{ "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
			{ "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
			{ "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
			{ "<leader>fe", function() Snacks.explorer() end, desc = "File Explorer" },
			{ "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
			{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
			{ "<leader>fG", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
		}
	}
}
