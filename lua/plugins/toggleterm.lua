-- Quick terminal
return { {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
    }
    vim.keymap.set('n', '<leader>th', '<Cmd>ToggleTerm direction=horizontal<CR>')
    vim.keymap.set('n', '<leader>tv', '<Cmd>ToggleTerm direction=vertical<CR>')
    vim.keymap.set('n', '<leader>tt', '<Cmd>ToggleTerm<CR>')
		vim.keymap.set({"n", "t", "i"}, '<C-Esc>', '<Cmd>ToggleTerm direction=float<CR>')
  end
} }
