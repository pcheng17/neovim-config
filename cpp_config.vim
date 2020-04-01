" ----------------------------------------------------------------------------
" C++ config
" ----------------------------------------------------------------------------

" Set comment style for C++ files
augroup cpp_config
	autocmd!
    autocmd FileType c,cpp setlocal commentstring=//\ %s
    autocmd FileType c,cpp setlocal comments-=:// comments+=f://
    autocmd BufWritePre * %s/\s\+$//e
augroup END
