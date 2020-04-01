" ----------------------------------------------------------------------------
" C++ config
" ----------------------------------------------------------------------------

" Set comment style for C++ files
augroup cpp_config
	autocmd!
    " Set the comment string to be //
    autocmd FileType c,cpp setlocal commentstring=//\ %s
    " Continuation of doxygen-style comments, i.e. ///
    autocmd FileType c,cpp setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,bO:///
    " Disable continuation of single-line comments
    autocmd FileType c,cpp setlocal comments-=:// comments+=f://
    " Remove all trailing whitespace
    autocmd BufWritePre * %s/\s\+$//e
augroup END
