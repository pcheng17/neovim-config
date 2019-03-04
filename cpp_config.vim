" ----------------------------------------------------------------------------
" C++ config 
" ----------------------------------------------------------------------------

" Set comment style for C++ files
augroup cpp_config
	autocmd!
    autocmd FileType c,cpp,java setlocal commentstring=//\ %s
augroup END
