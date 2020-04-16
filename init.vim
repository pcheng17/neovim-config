" ----------------------------------------------------------
"" Load plugins
" ----------------------------------------------------------
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
let isWindows = has('win32') || has('win64')

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
" TODO This belongs inside an if statement for gui_running!!!
if isUnix
    set guifont=Monospace\ 11
end
if isMac
    set guifont=Consolas:h16
    " set guifont=Inconsolata:h17
    " set guifont=Roboto\ Mono:h15
end
if isWindows
    set guifont=Consolas:h13
end

set background=dark
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
silent colorscheme gruvbox
" silent colorscheme jellybeans

" gruvbox related settings
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>
nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" Lightline settings
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }
set noshowmode

" Sessions options
let g:session_autosave = 'no'

" ----------------------------------------------------------------------------
" Basic settings
" ----------------------------------------------------------------------------
if has("gui_running")
    if isMac
        set lines=50 columns=110
    else
        set lines=59 columns=110        " Initial window size
    endif
    set guioptions-=T                   " Remove top tool bar
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

set noeb vb t_vb=                       " Disable audio and visual bell

" Source vimrc
command SourceConfig source ~/.vimrc

" Disable automatic comment continuation
autocmd BufNewFile,BufRead,FileType * set formatoptions-=cro
autocmd BufNewFile,BufRead,FileType * setlocal formatoptions-=cro

" Remove all trailing whitespace and then return the cursor back to its
" original location (where it was when this function was invoked).
function! <SID>StripTrailingWhitespaces()
    let pos = getpos(".")
    %s/\s\+$//e
    call setpos('.', pos)
endfun

" Remove trailing whitespace before writing
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" ----------------------------------------------------------
"" vim-fugitive settings and mappings
" ----------------------------------------------------------
nnoremap <Leader>gs :Git status<CR>

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
source ~/vim-config/cpp_config.vim
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
        autocmd SwapExists * call AS_HandleSwapfile(expand('<afile>:p'), v:swapname)
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
