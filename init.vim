" ----------------------------------------------------------------------------
" Load plugins
" ----------------------------------------------------------------------------
source ~/vim-config/plugins.vim



" ----------------------------------------------------------------------------
" Leader
" ----------------------------------------------------------------------------
let mapleader="\<SPACE>"
nnoremap <Space> <nop>



" ----------------------------------------------------------------------------
" Basic settings 
" ----------------------------------------------------------------------------
" Only set termguicolors if not on Mac (colors look terrible)
if !has('macunix')
	if (has("termguicolors"))
    	set termguicolors
	end
end

" Set font size
" Wrap this first one in a conditional for my work computer 
set guifont=Monospace\ 11

if has('macunix')
    set guifont=Consolas:h14
end

" Initialize theme 
let ayucolor="dark"
colorscheme ayu

" Turn on relative line numbers
set relativenumber

" Set tab indent to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" More natural window-splitting behavior
set splitright
set splitbelow

" Make lightline work on one window
set laststatus=2

" Search config
set incsearch
set hlsearch

" Turn on cursor line highlight
set cursorline



" ----------------------------------------------------------------------------
" Load other specific settings
" ----------------------------------------------------------------------------
source ~/vim-config/a.vim
source ~/vim-config/mappings.vim
source ~/vim-config/tex_config.vim
source ~/vim-config/fzf_config.vim
source ~/vim-config/cpp_config.vim
