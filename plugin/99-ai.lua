vim.pack.add({
	"https://github.com/github/copilot.vim",
	"https://github.com/folke/sidekick.nvim",
})

require('sidekick').setup({
	nes = { enabled = true },
	cli = {
		mux = {
			enabled = true,
			backend = "tmux"
		},
	},
})

vim.keymap.set({ "n", "x", "o" }, "<tab>", function()
	if not require("sidekick").nes_jump_or_apply() then
		return "<Tab>"
	end
end, { expr = true, desc = "Goto/Apply Next Edit Suggestion" })

vim.keymap.set("n", "<leader>aa", function() require("sidekick.cli").toggle() end, { desc = "Sidekick Toggle CLI" })
vim.keymap.set("n", "<leader>as", function() require("sidekick.cli").select() end, { desc = "Select CLI" })
vim.keymap.set("n", "<leader>ad", function() require("sidekick.cli").close() end, { desc = "Detach a CLI Session" })
vim.keymap.set({ "x", "n" }, "<leader>at", function() require("sidekick.cli").send({ msg = "{this}" }) end, { desc = "Send This" })
vim.keymap.set({ "x", "n" }, "<leader>af", function() require("sidekick.cli").send({ msg = "{file}" }) end, { desc = "Send File" })
vim.keymap.set({"v"}, "<leader>av", function() require("sidekick.cli").send({ msg = "{selection}" }) end, { desc = "Send Selection" })

