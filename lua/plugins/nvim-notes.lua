return {
	{"Tebro/notes-nvim", 
		--dev = true, 
		config = function() 
			require("notes-nvim").setup({
				notes_dir = vim.fn.expand("~/Sync/notes"),
			})
		end,
		keys = {
			{"<leader>nn",
				function()
					require("notes-nvim").new_note()
				end,
				desc = "New Note",
			},
			{
				"<leader>nj",
				function()
					require("notes-nvim").new_journal_entry()
				end,
				desc = "New Journal Entry",
			},
			{
				"<leader>nq",
				function()
					require("notes-nvim").new_quick_note()
				end,
				desc = "New Quick Note",
			},
			{
				"<leader>nf",
				function()
					require("notes-nvim").find_notes()
				end,
				desc = "Find Notes",
			},
			{
				"<leader>ng",
				function()
					require("notes-nvim").search_notes()
				end,
				desc = "Find Notes",
			},
		}
	}
}
