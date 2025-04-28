return {
	{
		"jbyuki/nabla.nvim",
		keys = function()
			return {
				{
					"<leader>n",
					function()
						require("nabla").popup()
					end,
					desc = "NablaPopUp",
				},
				{
					"<leader>N",
					function()
						require("nabla").toggle_virt()
					end,
					desc = "NablaToggle",
				},
			}
		end,

	},
	{
		-- Make sure to set this up properly if you have lazy=true
		'MeanderingProgrammer/render-markdown.nvim',
		opts = {
			file_types = { "markdown", "Avante" },
			latex = { enabled = false },
			win_options = { conceallevel = { rendered = 2 } },
			--on = {
			--	render = function()
			--		require('nabla').enable_virt({ autogen = true })
			--	end,
			--	clear = function()
			--		require('nabla').disable_virt()
			--	end
			--},
		},
		ft = { "markdown", "Avante" },
	}
}
--return {
--	"iamcco/markdown-preview.nvim",
--	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--	build = "cd app && npm install",
--	init = function()
--		vim.g.mkdp_filetypes = { "markdown" }
--	end,
--	ft = { "markdown" },
--}
