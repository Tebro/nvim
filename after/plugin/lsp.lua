local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })

  local opts = { buffer = bufnr, remap = false }
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

end)

vim.g.markdown_fenced_languages = {
    "ts=typescript"
}
local nvim_lsp = require('lspconfig')
-- Just need to set the directory for denols to startup in
-- if it detects either files thats what it will do
lsp_zero.configure('denols', {
    root_dir = nvim_lsp.util.root_pattern("deno.json", "import_map.json"),
})


lsp_zero.configure('ts_ls', {
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false
})


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
  handlers = {
    lsp_zero.default_setup,
  },
})
