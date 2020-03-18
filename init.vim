" ----------------------------------------------------------------------------
" Load plugins
" ----------------------------------------------------------------------------
source ~/vim-config/plugins.vim

" ----------------------------------------------------------------------------
" Add runtimepaths
" ----------------------------------------------------------------------------
set runtimepath+=~/.vim/my-snippets/

" ----------------------------------------------------------------------------
" Detect operating system
" ----------------------------------------------------------------------------
let isUnix = has('unix')
let isMac = has('macunix')

" ----------------------------------------------------------------------------
" Leader
" ----------------------------------------------------------------------------
let mapleader="\<SPACE>"
nnoremap <Space> <nop>

" ----------------------------------------------------------------------------
" Aesthetics
" ----------------------------------------------------------------------------
" Only set termguicolors if not on Mac (colors look terrible)
if !isMac
	if (has("termguicolors"))
    	set termguicolors
	end
end

" Set font size
" Wrap this first one in a conditional for my work computer
set guifont=Monospace\ 11

if isMac
    set guifont=Consolas:h14
end

" let ayucolor = "dark"
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
silent colorscheme gruvbox
" set bg=dark
" colorscheme janah

" gruvbox related settings
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>
nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" gruvbox lightline settings
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

" ----------------------------------------------------------------------------
" Basic settings
" ----------------------------------------------------------------------------
if has("gui_running")
    if isMac
        set lines=50 columns=110
    else
        set lines=59 columns=110        " Initial window size
    endif
endif

set relativenumber                      " Relative line numbers

set tabstop=4 shiftwidth=4 expandtab    " Use four spaces for tabs

set splitright                          " Horizonital splits will always split to the right
set splitbelow                          " vertical splits will always split below

set laststatus=2                        " Always display the status bar

set mouse=a                             " Enable mouse

set incsearch                           " Incremental search highlight
set hlsearch                            " Highlight search patterns
set cursorline                          " Highlight current line

set wildmenu                            " Better menu with completion in command mode
set wildmode=longest:full,full

set completeopt=longest,menuone,preview " Better insert mode completions

if isUnix                               " If work machine...
    set swapfile                        " turn on swap files...
    set dir=/tmp                        " and set their location to the /tmp dir
end

set noeb vb t_vb=                       " Disable audio and visual bell

" ----------------------------------------------------------------------------
" Ultisnips configuration
" ----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ----------------------------------------------------------------------------
" Load other specific settings
" ----------------------------------------------------------------------------
source ~/vim-config/a.vim
source ~/vim-config/mappings.vim
source ~/vim-config/tex_config.vim
source ~/vim-config/cpp_config.vim
source ~/vim-config/py_config.vim
source ~/vim-config/fzf_config.vim
source ~/vim-config/nerdtree-config.vim
source ~/vim-config/vim-grepper_config.vim
source ~/vim-config/vim-rooter_config.vim
source ~/vim-config/vim-startify_config.vim

" ----------------------------------------------------------------------------
" Autoload files that have changed
" Thanks to https://github.com/neovim/neovim/issues/2127
" ----------------------------------------------------------------------------
augroup AutoSwap
        autocmd!
        autocmd SwapExists *  call AS_HandleSwapfile(expand('<afile>:p'), v:swapname)
augroup END

function! AS_HandleSwapfile (filename, swapname)
        " if swapfile is older than file itself, just get rid of it
        if getftime(v:swapname) < getftime(a:filename)
                call delete(v:swapname)
                let v:swapchoice = 'e'
        endif
endfunction
autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
  \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
    endif
augroup END
