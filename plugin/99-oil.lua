
vim.pack.add({
	-- deps
	"https://github.com/echasnovski/mini.icons",


	"https://github.com/stevearc/oil.nvim",
})

require("oil").setup({
	win_options = {
		winbar = "%#@attribute.builtin#%{substitute(v:lua.require('oil').get_current_dir(), '^' . $HOME, '~', '')}",
	}
})
