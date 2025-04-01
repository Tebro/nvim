return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        extensions = { "lazy",  "fugitive", "mason", "aerial", "oil", "quickfix", "toggleterm" }
      })
    end
  },
}
