return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
	config = function () 
		vim.api.nvim_create_autocmd({ "BufEnter" }, {
			pattern = { "*.norg" },
			callback = function()
				vim.opt.conceallevel = 3
			end,
		})
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.summary"] = {},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/Sync/notes",
						},
						default_workspace = "notes",
					},
				},
				["core.integrations.telescope"] = {
					config = {
						insert_file_link = {
							show_title_preview = true,
						},
					},
				},
			},
		})
		vim.keymap.set("n", "<localleader>jj", ":Neorg journal today<cr>")
		vim.keymap.set("n", "<localleader>jt", ":Neorg journal tomorrow<cr>")
		vim.keymap.set("n", "<localleader>jy", ":Neorg journal yesterday<cr>")
		vim.keymap.set("n", "<localleader>jl", ":Neorg journal toc<cr>")
		vim.keymap.set("n", "<leader>fn", "<Plug>(neorg.telescope.find_norg_files)")
		vim.keymap.set("n", "<leader>fN", "<Plug>(neorg.telescope.insert_link)")
	end
}
