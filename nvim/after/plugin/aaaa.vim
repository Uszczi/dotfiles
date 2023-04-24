let g:neoformat_python_isort = {
        \ 'exe': 'isort',
        \ 'args': ['-', '--quiet','--profile black'],
        \ 'stdin': 1,
        \ }



au FileType dap-repl lua require('dap.ext.autocompl').attach()


augroup uuuuuu
        autocmd!
        autocmd BufWritePre *.prisma lua vim.lsp.buf.format()
augroup END


