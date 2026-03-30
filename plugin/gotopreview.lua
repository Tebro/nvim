vim.pack.add({
	"https://github.com/rmagatti/goto-preview",
})

local gotop = require('goto-preview')
gotop.setup {
	height = 30,
	--debug = true
}

vim.keymap.set('n', 'gpd', gotop.goto_preview_definition, {})
vim.keymap.set('n', 'gpi', gotop.goto_preview_implementation, {})
vim.keymap.set('n', 'gpr', gotop.goto_preview_references, {})
vim.keymap.set('n', 'gpt', gotop.goto_preview_type_definition, {})
vim.keymap.set('n', 'gP', gotop.close_all_win, {})
