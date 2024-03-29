-- [[ Setting options ]]
-- See `:help vim.o`

vim.opt.hlsearch = false

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.mouse = "ar"

vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true
vim.g.undotree_WindowLayout = 2

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

vim.o.termguicolors = true

vim.o.completeopt = "menu,menuone,noselect"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 50

vim.o.clipboard = "unnamedplus"
vim.opt.colorcolumn = "120"

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.sidescrolloff = 12

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wrap = false

vim.cmd [[ :set noswapfile ]]
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true

vim.o.ff = "unix"
vim.cmd [[ :set ff=unix ]]

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
