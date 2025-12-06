return {
	{ 
		url = "https://codeberg.org/andyg/leap.nvim.git",
		dependencies = { "tpope/vim-repeat" },
		keys = {
			{ "s", mode = { "n", "x", "o" }, '<Plug>(leap)' },
			{ "S", mode = 'n', '<Plug>(leap-from-window)' },
			{ "gs", mode = { "n", "o"}, function() 
				require('leap.remote').action {
					-- Automatically enter Visual mode when coming from Normal.
					input = vim.fn.mode(true):match('o') and '' or 'v'
				}
			end},
			{ "gS", mode = { "n", "o"}, function() 
				require('leap.remote').action { input = 'V' }
			end},
			{ "R", mode = {"x", "o"}, function()
				require('leap.treesitter').select {
					opts = require('leap.user').with_traversal_keys('R', 'r')
				}
			end}
		},
		config = function()
			require('leap').opts.preview = function (ch0, ch1, ch2)
				return not (
					ch1:match('%s')
					or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
				)
			end

			-- Define equivalence classes for brackets and quotes, in addition to
			-- the default whitespace group:
			require('leap').opts.equivalence_classes = {
				' \t\r\n', '([{', ')]}', '\'"`'
			}

			-- Use the traversal keys to repeat the previous motion without
			-- explicitly invoking Leap:
			require('leap.user').set_repeat_keys('<enter>', '<backspace>')
		end

	} 
}
