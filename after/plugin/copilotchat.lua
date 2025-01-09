
vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChatToggle<CR>')
vim.keymap.set('n', '<leader>c<return>', ':CopilotChat ')
vim.keymap.set('v', '<leader>c<return>', ':CopilotChat ')
vim.keymap.set('n', '<leader>crr', '<cmd>CopilotChatReview<CR>')
vim.keymap.set('n', '<leader>crc', '<cmd>CopilotChatReviewClear<CR>')

vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("v", "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
