vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
--vim.opt.expandtab = true
vim.opt.smartindent = true
-- everything yanked goes to the MMB clipboard (linux)
vim.opt.clipboard = 'unnamed'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.signcolumn = "yes"


vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false

vim.opt.colorcolumn = "80"

vim.opt.laststatus = 3

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
