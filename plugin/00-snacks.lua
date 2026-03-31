vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

require("snacks").setup({
	animate = { enabled = true },
	input = {},
	picker = {
		enabled = true,
		actions = {
			opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
		},
		win = {
			input = {
				keys = {
					["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
				},
			},
		}
	},
	explorer = { enabled = true },
})

vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>n", function() Snacks.picker.notifications() end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>fe", function() Snacks.explorer() end, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set({ "n", "x" }, "<leader>fG", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })
