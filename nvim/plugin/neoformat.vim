" TODO fix isort
" let g:neoformat_enabled_python = ['black', 'isort']
let g:neoformat_enabled_python = ['black']

let g:neoformat_vue_vet = {
            \ 'exe': '/usr/local/bin/prettier-eslint',
            \ 'args': ["--parser=vue", "--log-level=silent"],
            \ 'replace': 0,
            \ 'stdin': 0,
            \ 'stderr': 1,
            \ }
let g:neoformat_enabled_vue = ['vet']

let g:neoformat_enabled_javascript = ['vet']

let g:neoformat_run_all_formatters = 1

" let g:neoformat_verbose = 1 " only affects the verbosity of Neoformat
" let &verbose            = 1 " also increases verbosity of the editor as a whole
