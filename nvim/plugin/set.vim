set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*


" Witout that bind in docker doesn't work
" https://github.com/moby/moby/issues/15793
set backupcopy=yes

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
set colorcolumn=80
set backspace=indent,eol,start

set completeopt=menu,menuone,noselect
set hlsearch
set smartcase
set ignorecase

set laststatus=3

augroup FIRST_AUTOGROUP
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * Neoformat
augroup END


set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
set foldlevelstart=99

let g:airline_theme = 'base16_dracula'
