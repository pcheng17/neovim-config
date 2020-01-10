" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Colors
Plug 'ayu-theme/ayu-vim'
Plug 'pcheng17/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'mhinz/vim-janah'
" Plug 'arcticicestudio/nord-vim'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

" Utils
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'bfrg/vim-cpp-modern'
Plug 'qpkorr/vim-bufkill'
Plug 'terryma/vim-multiple-cursors'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mhinz/vim-grepper'
Plug 'airblade/vim-rooter'
Plug 'mileszs/ack.vim'
" Plug 'w0rp/ale'

" Ultisnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Latex
Plug 'lervag/vimtex'

" Override vim syntax for yaml files
Plug 'stephpy/vim-yaml'

" Initialize plugin system
call plug#end()
