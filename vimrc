set nu rnu
" set ignorecase

syntax on

set hidden
set noerrorbells
set tabstop=2
set softtabstop=2
set shiftwidth=2
"set expandtab
set smartindent
" set nu
" set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set encoding=utf-8
set guifont=DroidSansMono\ Nerd\ Font\ 11

" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
map <C-w> :w<CR>

" Give more space for displaying messages.
set cmdheight=2
vmap <C-_> <plug>NERDCommenterToggle<CR>
nmap <C-_> <plug>NERDCommenterToggle<CR>
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap diff <Plug>(GitGutterPreviewHunk)

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" set updatetime=50

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver',
Plug 'fannheyward/coc-pyright'
Plug 'ycm-core/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'gruvbox-community/gruvbox'
Plug 'w0rp/ale'
Plug 'storyn26383/vim-vue'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mlaursen/vim-react-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'hashivim/vim-terraform'
Plug 'chr4/nginx.vim'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ctrlp_use_caching = 0
let g:jsx_ext_required = 1
let g:airline_theme='base16'

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

"fun! GoYCM()
    "nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
    "nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
"endfun

fun! GoCoc()
    inoremap <buffer> <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <buffer> <silent><expr> <C-space> coc#refresh()

    " GoTo code navigation.
    nmap <buffer> <leader>gd <Plug>(coc-definition)
    nmap <buffer> <leader>gy <Plug>(coc-type-definition)
    nmap <buffer> <leader>gi <Plug>(coc-implementation)
    nmap <buffer> <leader>gr <Plug>(coc-references)
    nnoremap <buffer> <leader>cr :CocRestart
endfun

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-pyright',
  \ ]

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
autocmd FileType typescript :call GoYCM()
autocmd FileType cpp,cxx,h,hpp,c :call GoCoc()

let g:ale_fixers = {
 \ '*': ['trim_whitespace'],
 \ 'javascript': ['eslint'],
 \ 'python': ['pylint']
 \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 1

let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()
let g:loaded_perl_provider = 0
