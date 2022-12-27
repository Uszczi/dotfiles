let g:neoformat_enabled_python = ['black', 'isort']

" let g:neoformat_vue_vet = {
"             \ 'exe': 'prettier',
"             \ 'args': ["--loglevel=silent"],
"             \ 'replace': 1,
"             \ 'stdin': 1,
"             \ 'stderr': 1,
"             \ }
"
" let g:neoformat_javascript_vet = {
"             \ 'exe': 'prettier',
"             \ 'args': ["--loglevel=silent"],
"             \ 'replace': 1,
"             \ 'stdin': 1,
"             \ 'stderr': 1,
"             \ }


let g:neoformat_run_all_formatters = 0

let g:neoformat_verbose = 0 " only affects the verbosity of Neoformat
let &verbose            = 0 " also increases verbosity of the editor as a whole
