local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })

  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<leader>lr', ':LspRestart<cr>', opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>lf', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end)


require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'rust_analyzer', 'gopls' },
  handlers = {
    lsp_zero.default_setup,
  },
})
