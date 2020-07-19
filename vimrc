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
map <C-w> :w<CR>

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" set updatetime=50

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

