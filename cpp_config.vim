" ----------------------------------------------------------------------------
" C++ config
" ----------------------------------------------------------------------------

" Set comment style for C++ files
augroup cpp_config
	autocmd!
    " Set the comment string to be //
    autocmd FileType c,cpp setlocal commentstring=//\ %s
    " Continuation of multiline comments
    " autocmd FileType c,cpp setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/
    " Disable continuation of single-line comments
    autocmd FileType c,cpp setlocal comments-=:// comments+=f://
augroup END

" Do not indent inside namespace block
set cino=N-s
