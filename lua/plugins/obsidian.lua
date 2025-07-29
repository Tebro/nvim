return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = false,
	ft = "markdown",
	keys = {
		{ "<leader>nn", "<Cmd>Obsidian new<CR>" },

		{ "<leader>nj", "<Cmd>Obsidian today<CR>" },
		{ "<leader>nt", "<Cmd>Obsidian tomorrow<CR>" },
		{ "<leader>ny", "<Cmd>Obsidian yesterday<CR>" },


		{ "<leader>nf", "<Cmd>Obsidian quick_switch<CR>" },
		{ "<leader>ng", "<Cmd>Obsidian search<CR>" },
	},
	opts = {
		workspaces = {
			{
				name = "notes",
				path = "~/Sync/notes",
			},
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
			nvim_cmp = true,
			-- Enables completion using blink.cmp
			blink = false,
			-- Trigger completion at 2 chars.
			min_chars = 2,
			-- Set to false to disable new note creation in the picker
			create_new = true,
		},

		-- see below for full list of options 👇
	},
}
