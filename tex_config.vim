" ----------------------------------------------------------------------------
" Latex config
" ----------------------------------------------------------------------------

augroup vimtex_config
	autocmd!
    autocmd User VimtexEventInitPost VimtexCompile
augroup END