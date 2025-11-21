return {
	{'Vigemus/iron.nvim', 
		config = function() 
			local iron = require("iron.core")
			local view = require("iron.view")
			local common = require("iron.fts.common")


			iron.setup {
				config = { -- Whether a repl should be discarded or not
					scratch_repl = true,
					repl_open_cmd = view.split.vertical.botright(0.4),
					-- Your repl definitions come here
					repl_definition = {
						sh = {
							-- Can be a table or a function that
							-- returns a table (see below)
							command = {"bash"}
						},
						python = {
							command = { "python3" },  -- or { "ipython", "--no-autoindent" }
							format = common.bracketed_paste_python,
							block_dividers = { "# %%", "#%%" },
							env = {PYTHON_BASIC_REPL = "1"} --this is needed for python3.13 and up.
						}
					},
				},
				keymaps = {
					toggle_repl = "<leader>rr",
					restart_repl = "<leader>rR",
					send_line = "<leader>rl",
					visual_send = "<leader>rv",
					send_file = "<leader>rf",
					exit = "<leader>rq",
					interrupt = "<leader>rx",
					clear = "<leader>rc",
					send_code_block = "<leader>rb",
				}

			}
		end
	}
}
