require("tebro.set")
require("tebro.remap")
require("tebro.lazy")
require("tebro.functions")

if vim.g.neovide then
	require("tebro.neovide")
end


-- Pretty colors
vim.cmd [[colorscheme catppuccin]]
