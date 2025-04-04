return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				extensions = { "lazy", "fugitive", "mason", "aerial", "oil", "quickfix", "toggleterm" },
				winbar = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { {'filename', path = 1, file_status = true, shorting_target = 0} },
					lualine_x = {},
					lualine_y = {},
					lualine_z = {}
				},
				inactive_winbar = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { {'filename', path = 1, file_status = true, shorting_target = 0} },
					lualine_x = {},
					lualine_y = {},
					lualine_z = {}
				},
			})
		end
	},
}
