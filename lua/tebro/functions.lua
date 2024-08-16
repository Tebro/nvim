function CopilotChatReviewClear()
	local ns = vim.api.nvim_create_namespace('copilot_review')
	vim.diagnostic.reset(ns)
end

vim.api.nvim_create_user_command(
	'CopilotChatReviewClear',
	CopilotChatReviewClear,
	{}
)
