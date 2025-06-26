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
		--git_auto_restore_on_branch_change = true,
	}
}
