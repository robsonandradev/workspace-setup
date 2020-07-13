set number
" set ignorecase

syntax on

set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
" set nu
set nowrap
set smartcase
set noswapfile
set nobackup
" set undodir=~/.vim/undodir
" set undofile
set incsearch

autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

