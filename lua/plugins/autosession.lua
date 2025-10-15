local function is_main_branch()
	local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
	if handle then
		local result = handle:read("*a")
		handle:close()
		local branch_name = result:match("^%s*(.-)%s*$") -- trim whitespace
		if branch_name == "main" or branch_name == "master" then
			return true
		else
			return false
		end
	else
		return false
	end
end

vim.api.nvim_create_user_command("IsMain", function()
	if is_main_branch() then
		vim.notify("On main branch", vim.log.levels.INFO)
	else 
		vim.notify("Not on main branch", vim.log.levels.INFO)
	end
end, { desc = "Check if currently on main or master branch" })


return {
	'rmagatti/auto-session',
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { '~/', '~/code', '~/Downloads', '/' },
		-- log_level = 'debug',
		cwd_change_handling = true,
		git_use_branch_name = true,
		git_auto_restore_on_branch_change = true,
		pre_save_cmds = { 
			function()
				if is_main_branch() then
					return false
				end
			end
		},
		pre_restore_cmds = { 
			function()
				if is_main_branch() then
					return false
				end
			end
		},
	}
}
