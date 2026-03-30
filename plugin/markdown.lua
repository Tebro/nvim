vim.pack.add({
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",

	"https://github.com/obsidian-nvim/obsidian.nvim"
})

require('render-markdown').setup({
	file_types = { "markdown", "Avante" },
	latex = { enabled = false },
	win_options = { conceallevel = { rendered = 2 } },
})


require('obsidian').setup({
	workspaces = {
		{
			name = "notes",
			path = "~/Sync/notes",
		},
	},
	picker = {
		name = 'snacks.pick'
	},
	legacy_commands = false,
	daily_notes = {
		-- Optional, if you keep daily notes in a separate directory.
		folder = "journal",
		-- Optional, if you want to change the date format for the ID of daily notes.
		date_format = "%Y-%m-%d",
		-- Optional, if you want to change the date format of the default alias of daily notes.
		alias_format = "%B %-d, %Y",
		-- Optional, default tags to add to each new daily note created.
		default_tags = { "journal" },
		-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
		template = nil,
		-- Optional, if you want `Obsidian yesterday` to return the last work day or `Obsidian tomorrow` to return the next work day.
		workdays_only = true,
	},

	-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
	completion = {
		-- Enables completion using nvim_cmp
		nvim_cmp = false,
		-- Enables completion using blink.cmp
		blink = false,
		-- Trigger completion at 2 chars.
		min_chars = 2,
		-- Set to false to disable new note creation in the picker
		create_new = true,
	},
})

vim.keymap.set("n", "<leader>nn", "<Cmd>Obsidian new<CR>")
vim.keymap.set("n", "<leader>nj", "<Cmd>Obsidian today<CR>")
vim.keymap.set("n", "<leader>nt", "<Cmd>Obsidian tomorrow<CR>")
vim.keymap.set("n", "<leader>ny", "<Cmd>Obsidian yesterday<CR>")
vim.keymap.set("n", "<leader>nf", "<Cmd>Obsidian quick_switch<CR>")
vim.keymap.set("n", "<leader>ng", "<Cmd>Obsidian search<CR>")
