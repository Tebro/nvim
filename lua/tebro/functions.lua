
-- Toggle inline diagnostics command
local inline_diagnostics_enabled = true
vim.api.nvim_create_user_command('DiagnosticsToggle', function()
  inline_diagnostics_enabled = not inline_diagnostics_enabled
  if inline_diagnostics_enabled then
    -- Enable inline diagnostics
    vim.diagnostic.config({
      virtual_text = true,
    })
    print("Inline diagnostics enabled")
  else
    -- Disable inline diagnostics
    vim.diagnostic.config({
      virtual_text = false,
    })
    print("Inline diagnostics disabled")
  end
end, { desc = "Toggle inline diagnostics display" })

vim.api.nvim_create_user_command("Cppath", function()
    local path = vim.fn.expand("%")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {}) 
