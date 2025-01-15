return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
		local neogit = require("neogit")
		neogit.setup{}

		vim.keymap.set('n', '<leader>gs', ':Neogit kind=split_above_all cwd=%:p:h<cr>')
		vim.keymap.set('n', '<leader>gf', ':Neogit kind=floating cwd=%:p:h<cr>')
		vim.keymap.set('n', '<leader>gt', ':Neogit kind=tab cwd=%:p:h<cr>')

		vim.keymap.set('n', '<leader>gl', ':NeogitLogCurrent<cr>')

	end
}
