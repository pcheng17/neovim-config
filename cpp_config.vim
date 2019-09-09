" ----------------------------------------------------------------------------
" C++ config 
" ----------------------------------------------------------------------------

" Set comment style for C++ files
augroup cpp_config
	autocmd!
    autocmd FileType c,cpp,java setlocal commentstring=//\ %s
    autocmd FileType c,cpp setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,bO:///,O://
augroup END
