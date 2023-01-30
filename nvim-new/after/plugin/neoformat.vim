augroup FIRST_AUTOGROUP
    autocmd!
    autocmd BufFilePre  * TSEnable highlight
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * Neoformat
    autocmd TextYankPost * lua vim.highlight.on_yank {on_visual = false}
augroup END
