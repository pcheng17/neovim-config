" ----------------------------------------------------------------------------
" Python config 
" ----------------------------------------------------------------------------

" Remove trailing whitespace 
augroup py_config
    autocmd!
    autocmd BufWritePre *.py :%s/\s\+$//e
augroup END

