--return {}
return {
  'nvim-tree/nvim-web-devicons', -- Icons for explorer type thing
  {                              -- Explorer type thing
    'nvim-tree/nvim-tree.lua',
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require('nvim-tree').setup({
        sync_root_with_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
					update_cwd = true,
				},
      })
      vim.keymap.set('n', '<leader>e', '<Cmd>NvimTreeFocus<CR>') -- This also opens it if closed
      vim.keymap.set('n', '<leader>E', '<Cmd>NvimTreeFindFile<CR>')
      -- Close with <C-w>c
    end
  },
}
