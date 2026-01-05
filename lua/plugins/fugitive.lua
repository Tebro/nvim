return {
  { -- The best git tooling
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
    end
  },
	{ 
		'nvim-mini/mini.diff', 
		version = false,
		config = function()
			require('mini.diff').setup()
		end
	},
}


