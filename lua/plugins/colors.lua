-- Colorschemes, these just install them, chosen in tebro/init.lua
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000
	},
	{
		"arcticicestudio/nord-vim",
		name = "nord",
		lazy = false,
		priority = 1000
	},
	{
		"oskarnurm/koda.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	}
}
