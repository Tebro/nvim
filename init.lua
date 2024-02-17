-- <leader> is space
vim.g.mapleader = " "
-- use fs to get out of insert mode in files and terminal
vim.keymap.set('t', 'fd', '<C-\\><C-n>')
vim.keymap.set('i', 'fd', '<Esc>')

-- nice save shortcut
vim.keymap.set('n', '<leader>w', vim.cmd.update)
-- Edit this file
vim.keymap.set('n', '<leader>fe', ':e $MYVIMRC<cr>')

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- Visual mode move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Find/Replace for symbol under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Join lines, maintain cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Maintain center when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set('n', '<leader>e', function()
  vim.cmd.edit(vim.fn.getcwd())
end)
-- open dir of current file
vim.keymap.set('n', '<leader>E', vim.cmd.Ex)

-- clear highlight
vim.keymap.set('n', '<leader><return>', ':noh<cr>')

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
-- everything yanked goes to the MMB clipboard (linux)
vim.opt.clipboard = 'unnamed'

vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false


vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false

vim.opt.colorcolumn = "80"


-- Automatically install Lazy (package manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- End Lazy install

require("lazy").setup({
  'kdheepak/lazygit.nvim', -- A git GUI thing, not that fun
  "tpope/vim-surround",
  "sbdchd/neoformat",
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        extensions = { "lazy", "nvim-tree", "fugitive" }
      })
    end
  },
  { -- colorscheme
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000
  },
  -- Other colorscheme, these just install them, chosen at the bottom
  { "catppuccin/nvim",                  name = "catppuccin", lazy = false, priority = 1000 },

  { -- The best git tooling
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
    end
  },

  { -- Fuzzy file finder, also does buffers and live grep
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fr', builtin.resume, {})
    end
  },
  --'nvim-tree/nvim-web-devicons', -- Icons for explorer type thing
  --{                              -- Explorer type thing
  --  'nvim-tree/nvim-tree.lua',
  --  config = function()
  --    vim.g.loaded_netrw = 1
  --    vim.g.loaded_netrwPlugin = 1
  --    require('nvim-tree').setup({
  --      sync_root_with_cwd = true
  --    })
  --    vim.keymap.set('n', '<leader>e', '<Cmd>NvimTreeFocus<CR>') -- This also opens it if closed
  --    vim.keymap.set('n', '<leader>E', '<Cmd>NvimTreeFindFile<CR>')
  --    -- Close with <C-w>c
  --  end
  --},

  { -- Quick terminal
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
      vim.keymap.set('n', '<leader>tg', '<Cmd>LazyGit<CR>')
    end
  },
  {
    'rmagatti/goto-preview',
    --'Tebro/goto-preview',
    --branch = "focus_previous_preview",
    --dir = "/home/richard/code/goto-preview",
    config = function()
      local gotop = require('goto-preview')
      gotop.setup {
        height = 30,
        --debug = true
      }
      vim.keymap.set('n', 'gpd', gotop.goto_preview_definition, {})
      vim.keymap.set('n', 'gpi', gotop.goto_preview_implementation, {})
      vim.keymap.set('n', 'gpr', gotop.goto_preview_references, {})
      vim.keymap.set('n', 'gpt', gotop.goto_preview_type_definition, {})
      vim.keymap.set('n', 'gP', gotop.close_all_win, {})
    end
  },

  { -- AST parsing tools, quite nice for better syntax highlight and formatting when you don't have a LSP provided one
    'nvim-treesitter/nvim-treesitter',
    config = function()
      vim.cmd("TSUpdate")
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "c", "lua", "rust", "go", "typescript", "javascript", "html", "haskell", "bash", "json", "make" },

        auto_install = true, -- will install more parsers as you open relevant files
        highlight = {
          enable = true
        },
        indent = {
          enable = true
        }
      })
    end
  },
  -- Nice tool to install language servers to your system, can also do other tools (linters, debugging adapters)
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x'
  },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  {
    'mbbill/undotree',
    config = function()
      vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
      vim.opt.undofile = true
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },

})

-- Pretty colors
vim.cmd [[colorscheme catppuccin]]
