let g:neoformat_python_isort = {
        \ 'exe': 'isort',
        \ 'args': ['-', '--quiet','--profile black'],
        \ 'stdin': 1,
        \ }



au FileType dap-repl lua require('dap.ext.autocompl').attach()

augroup RemoveTrailingWhitespaces
        autocmd!
        autocmd BufWritePre * :%s/\s\+$//e
augroup END

augroup FormatPrisma
        autocmd!
        autocmd BufWritePre *.prisma lua vim.lsp.buf.format()
augroup END
