-- [[ Setting options ]]
-- See `:help vim.o`

vim.o.hlsearch = true

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.mouse = 'a'

vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 50
