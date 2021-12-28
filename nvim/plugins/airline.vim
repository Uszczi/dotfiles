let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '



" augroup DraculaOverrides
"     autocmd!
"     autocmd ColorScheme dracula highlight DraculaBoundary guibg=none
"     autocmd ColorScheme dracula highlight DraculaDiffDelete ctermbg=none guibg=none
"     autocmd ColorScheme dracula highlight DraculaComment cterm=italic gui=italic
"     autocmd User PlugLoaded ++nested colorscheme dracula
" augroup end




au FileType dap-repl lua require('dap.ext.autocompl').attach()







