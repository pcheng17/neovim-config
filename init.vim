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
" if (g:Env !~# 'DARWIN')
" 	if (has("termguicolors"))
"         set termguicolors
" 	end
" end

set background=dark
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
silent colorscheme gruvbox

" gruvbox related settings
" nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>
" nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
" nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
" nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" Airline settings
let g:airline_theme = 'gruvbox'
let g:airline_section_warning = ''
let g:airline_section_error = ''

" Lightline settings {{{
" let g:lightline = {
"     \ 'colorscheme': 'gruvbox',
"     \ 'active': {
"     \   'left': [ [ 'mode', 'paste' ],
"     \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
"     \   'right': [ [ 'lineinfo' ],
"     \              [ 'percent' ],
"     \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
"     \ },
"     \ 'component_function': {
"     \   'gitbranch': 'FugitiveHead'
"     \ },
"     \ }
" set noshowmode    " Removes the current mode from the bottom-most bar
" }}}

"-------------------------------------------------------------------------------
" Basic settings
"-------------------------------------------------------------------------------

" Create undo directory
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0700)
endif
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "", 0770)
endif

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

set cursorline
set hlsearch
set incsearch
set laststatus=2
set mouse=a
set noerrorbells
set noshowmode
set noswapfile
set nowrap
set number
set relativenumber
set scrolloff=8
set smartcase
set smartindent
set splitright
set splitbelow
set undodir=~/.vim/undodir
set undofile

set wildmenu                            " Better menu with completion in command mode
set wildmode=longest:full,full

set completeopt=longest,menuone,preview " Better insert mode completions

set noeb vb t_vb=                       " Disable audio and visual bell

set foldmethod=marker                   " Set folding method

" Disable automatic comment continuation
autocmd BufNewFile,BufRead,FileType * set formatoptions-=cro
autocmd BufNewFile,BufRead,FileType * setlocal formatoptions-=cro

" Remove all trailing whitespace
function! <SID>TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call <SID>TrimWhitespace()

" ag searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    " Use ag in CtrlP for listing files
    " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    " let g:ctrlp_use_cache
endif


" EditorConfig configurations {{{
let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']
" }}}
" C++ configurations {{{
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
" }}}
" Python configuration {{{
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0
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
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}
" vim-fugitive configurations {{{
nnoremap <Leader>gs :Git status<CR>
" }}}
" vim-grepper configurations {{{
nnoremap <Leader>ag :Grepper -tool git<CR>
nnoremap <Leader>* :Grepper -tool git -cword -noprompt<CR>
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
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'SumatraPDF'
"set conceallevel=1
"let g:tex_conceal = 'abdmg'
" }}}
" fzf configurations {{{
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
nnoremap <Leader><space> :GFiles<CR>
nnoremap <Leader>; :Buffers<CR>
" }}}

"-------------------------------------------------------------------------------
" Load other specific settings
"-------------------------------------------------------------------------------
source ~/vim-config/a.vim
"source ~/vim-config/coc_config.vim

"-------------------------------------------------------------------------------
" Mappings
"-------------------------------------------------------------------------------
nmap <Leader>fs :up<CR>
nmap <Leader>qq :q<CR>
nmap <Leader>fq :q!<CR>
nmap <bar> :vsplit<CR>
nmap _ :split<CR>
noremap J 10j
noremap K 10k
nnoremap <silent> <ESC> :noh<CR>
nnoremap <Leader><CR> :so ~/.vimrc<CR>
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap ++ :vertical resize +5<CR>
nnoremap -- :vertical resize -5<CR>
nnoremap <Leader>fd :NERDTreeToggle<CR>
nnoremap <Leader>ff :NERDTreeFind<CR>
nnoremap <Leader>gb :GBranches<CR>
nnoremap <Leader>ga :Git fetch --all<CR>
nnoremap <Leader>grum :Git rebase upstream/master<CR>
nnoremap <Leader>grom :Git rebase origin/master<CR>

" Shortcut to append this line with the next with a space
nnoremap U J

" Easier indentation
vnoremap < <gv
vnoremap > >gv

" Easy new lines
nnoremap <silent> <M-o> :call append(line('.'), '')<CR>
nnoremap <silent> <M-O> :call append(line('.')-1, '')<CR>

" Copy to clipboard
nnoremap <Leader>yy "+yy
nnoremap <Leader>y$ "+y$
vnoremap <Leader>y "+y

" Paste from clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" Menu navigation enhancement (for completeopt)
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <C-p> pumvisible() ? '<C-p>' :
"   \ '<C-p><C-r>=pumvisible() ? "\<lt>Up>" : ""<CR>'

" Iterative word replace via .
nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

" Repeat last macro used
nnoremap Q @@

" Execute the current line as if it's a command
nnoremap <Leader>e :exe getline(line('.'))<CR>

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
