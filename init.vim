"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

"-----------------------------------------------------------
" Plugins
"-----------------------------------------------------------
source ~/vim-config/plugins.vim

"-----------------------------------------------------------
" Set runtimepath
"-----------------------------------------------------------
set runtimepath+=~/.vim/my-snippets/

"-----------------------------------------------------------
" Detect operation system and host
"-----------------------------------------------------------
function! ConfigSetEnv() abort
    if exists('g:Env')
        return
    endif
    if has('win64') || has('win32') || has('win16')
        let g:Env = 'WINDOWS'
    else
        let g:Env = toupper(substitute(system('uname'), '\n', '', ''))
    endif
endfunction
call ConfigSetEnv()

function! ConfigSetHost() abort
    if exists('g:Hostname')
        return
    endif
       let g:Hostname = hostname()
endfunction
call ConfigSetHost()

"-----------------------------------------------------------
" Set leader key
"-----------------------------------------------------------
let mapleader="\<SPACE>"
nnoremap <Space> <nop>

"-----------------------------------------------------------
" Aesthetics
"-----------------------------------------------------------
" Only set termguicolors if not on Mac
if (g:Env !~# 'DARWIN')
	if (has("termguicolors"))
        set termguicolors
	end
end

" let g:forest_night_disable_italic_comment = 1
" colorscheme forest-night

" let g:nord_uniform_diff_background = 1
" colorscheme nord

set background=dark
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
silent colorscheme gruvbox

" gruvbox related settings
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>
nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" Lightline settings {{{
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }
set noshowmode    " Removes the current mode from the bottom-most bar
" }}}

" Sessions options
let g:session_autosave = 'no'

"-------------------------------------------------------------------------------
" Basic settings
"-------------------------------------------------------------------------------
if has("gui_running")
    if (g:Env =~# 'DARWIN')
        set lines=50
        set columns=100
        set guifont=Consolas:h15
        " set guifont=Inconsolata:h17
        " set guifont=Roboto\ Mono:h15
    elseif (g:Env =~# 'LINUX')
        set lines=59
        set columns=110
        set guifont=Monospace\ 11
    elseif (g:Env =~# 'WINDOWS')
        set lines=59
        set columns=110
        set guifont=Consolas:h13
    endif
    set guioptions-=T                   " Remove top tool bar
endif

set relativenumber                      " Relative line numbers
set number                              " Current line number

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

set foldmethod=marker                   " Set folding method

" Source vimrc
command! SourceConfig source ~/.vimrc

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

" EditorConfig configurations {{{
let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']
" }}}
" Nerdtree configurations {{{
let NERDTreeMapOpenSplit='s'
let NERDTreeMapPreviewSplit='gs'
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapPreviewVSplit='gv'
" }}}
" Ultisnips configurations {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}
" vim-easy-align configurations {{{
xmap ea <Plug>(EasyAlign)
nmap ea <Plug>(EasyAlign)
" }}}
" vim-fugitive configurations {{{
nnoremap <Leader>gs :Git status<CR>
" }}}
" vim-grepper configurations {{{
" Mappings
nnoremap <Leader>gr :Grepper -tool git<CR>
nnoremap <Leader>wgr :Grepper -tool git -cword -noprompt<CR>
" Search for todo and fixme
command! TODO :Grepper -tool git -noprompt -query '\(TODO\|FIXME\)'
" }}}
" vim-rooter configurations {{{
" :Rooter sets the working directory to the git root of the current file
let g:rooter_patterns = ['.git/']
let g:rooter_manual_only = 1
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir = 1
" }}}
" vimtex configurations {{{
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_mode = 0
set conceallevel=1
let g:tex_conceal = 'abdmg'
" }}}

"-------------------------------------------------------------------------------
" Load other specific settings
"-------------------------------------------------------------------------------
source ~/vim-config/a.vim
source ~/vim-config/mappings.vim
source ~/vim-config/cpp_config.vim
source ~/vim-config/fzf_config.vim
source ~/vim-config/vim-startify_config.vim
"source ~/vim-config/coc_config.vim

"-------------------------------------------------------------------------------
" Autoload files that have changed in neovim
" Thanks to https://github.com/neovim/neovim/issues/2127
"-------------------------------------------------------------------------------
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
