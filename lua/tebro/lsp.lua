vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.lsp.enable({"ts_ls", "lua_ls"})

local opts = {}
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>lr', ':LspRestart<cr>', opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', 'g.', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, opts)
vim.keymap.set('n', '<leader>Q', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>lf', function()
  vim.lsp.buf.format { async = true }
end, opts)
