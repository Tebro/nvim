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

		vim.keymap.set('n', '<leader>gS', function()
			neogit.open({kind = "floating"})
		end)

	end
}
