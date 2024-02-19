return {
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      plugins = {
        kitty = {
          enabled = true
        }
      },
      config = function()
        local zen = require("zen-mode")
        vim.keymap.set('n', '<leader>z', function()
          zen.toggle({
            width = .85
          })
        end)
      end
    }
  }
}
