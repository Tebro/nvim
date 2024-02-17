return {
  -- AST parsing tools, quite nice for better syntax highlight and formatting when you don't have a LSP provided one
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      vim.cmd("TSUpdate")
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "c", "lua", "rust", "go", "typescript", "javascript", "html", "haskell", "bash", "json", "make" },

        auto_install = true, -- will install more parsers as you open relevant files
        highlight = {
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true
        }
      })
    end
  }
}
