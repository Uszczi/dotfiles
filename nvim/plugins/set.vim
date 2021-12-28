set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set expandtab
set shiftwidth=4
set tabstop=4

set hidden
set signcolumn=yes
set relativenumber
set number
set termguicolors
set nowrap

set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set splitbelow
set updatetime=100
set clipboard=unnamedplus

set hlsearch
set smartcase
set ignorecase

augroup FIRST_AUTOGROUP
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
