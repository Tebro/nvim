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

		vim.keymap.set('n', '<leader>gS', ':Neogit kind=split_above_all cwd=%:p:h<cr>')
		vim.keymap.set('n', '<leader>gf', ':Neogit kind=floating cwd=%:p:h<cr>')
		vim.keymap.set('n', '<leader>gt', ':Neogit kind=tab cwd=%:p:h<cr>')

		vim.keymap.set('n', '<leader>gl', ':NeogitLogCurrent<cr>')

		--vim.api.nvim_create_autocmd("User", {
		--	pattern = "NeogitStatusRefreshed",
		--	callback = function()
		--		vim.cmd("set autoread | checktime")
		--	-- This will remain for archeological purposes
		--	--	local buffers = vim.tbl_filter(function(buf)
		--	--		return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].filetype ~= "NeogitStatus"
		--	--	end, vim.api.nvim_list_bufs())

		--	--	for _, buf in ipairs(buffers) do
		--	--		vim.cmd("checktime " .. buf)
		--	--	end
		--	end
		--})

	end
}
