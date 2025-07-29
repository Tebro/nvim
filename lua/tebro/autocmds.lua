
-- Set conceallevel to 2 on markdown files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.opt.conceallevel = 2
  end,
})
