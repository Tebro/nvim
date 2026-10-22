
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

vim.api.nvim_create_user_command("CdGitRoot", function()
    local path = vim.api.nvim_buf_get_name(0)
    if path == "" or vim.bo.buftype ~= "" then
        path = vim.fn.getcwd()
    end

    local root = vim.fs.root(path, ".git")
    if not root then
        vim.notify("No parent Git repository found", vim.log.levels.WARN)
        return
    end

    vim.api.nvim_cmd({ cmd = "cd", args = { root } }, {})
end, { desc = "Change working directory to the nearest parent Git root" })
