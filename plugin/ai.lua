vim.pack.add({
	"https://github.com/github/copilot.vim",
	"https://github.com/folke/sidekick.nvim",

	"https://github.com/nickjvandyke/opencode.nvim",
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

-- vim.keymap.set({ "n", "t", "i", "x" }, "<c-.>", function() require("sidekick.cli").toggle() end, { desc = "Sidekick Toggle" })
-- vim.keymap.set("n", "<leader>aa", function() require("sidekick.cli").toggle() end, { desc = "Sidekick Toggle CLI" })
-- vim.keymap.set("n", "<leader>as", function() require("sidekick.cli").select() end, { desc = "Select CLI" })
-- vim.keymap.set("n", "<leader>ad", function() require("sidekick.cli").close() end, { desc = "Detach a CLI Session" })
-- vim.keymap.set({ "x", "n" }, "<leader>at", function() require("sidekick.cli").send({ msg = "{this}" }) end, { desc = "Send This" })
-- vim.keymap.set({ "x", "n" }, "<leader>af", function() require("sidekick.cli").send({ msg = "{file}" }) end, { desc = "Send File" })
-- vim.keymap.set({"v"}, "<leader>av", function() require("sidekick.cli").send({ msg = "{selection}" }) end, { desc = "Send Selection" })

---@type opencode.Opts
vim.g.opencode_opts = {
	server = {
		start = function() 
      require("opencode.terminal").open("opencode --agent plan --port", {
        split = "right",
        width = math.floor(vim.o.columns * 0.35),
      })
		end,
		toggle = function()
      require("opencode.terminal").toggle("opencode --agent plan --port", {
        split = "right",
        width = math.floor(vim.o.columns * 0.35),
      })
		end
	}
}

vim.o.autoread = true -- Required for `opts.events.reload`

-- Recommended/example keymaps
vim.keymap.set({ "n", "x" }, "<leader>as", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
vim.keymap.set({ "n", "x" }, "<leader>ac", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
vim.keymap.set({ "n", "t" }, "<leader>aa", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })

vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { desc = "Add range to opencode", expr = true })
vim.keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Add line to opencode", expr = true })

