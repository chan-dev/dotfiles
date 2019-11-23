" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on


call plug#begin('~/.vim/plugged')

" -----Configuration-----
let mapleader = ","

" Encoding
set encoding=utf-8

" Linters
" set pyxversion=3
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint'],
      \}
" Use ALE for completion sources for all code.

" General Configurations
set nospell
map <leader>st :set spell!<CR>
set history=1000
set autoread
set hidden
set noerrorbells
set visualbell " flash the screen instead of beeping on errors
set mouse=a
set title
set nomodeline " security measure
" set pythonthreedll=python38.dll

set omnifunc=ale#completion#OmniFunc

" Swap/Backup
set noswapfile
set nobackup
set nowb

" Whitespace & Indentation
set nowrap
set textwidth=78
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set autoindent
set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>

" Cursor motion
set scrolloff=3
set sidescrolloff=5
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs

" Folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable " don't fold by default
set foldlevel=1

" UI Settings
if has('gui_running')
  set guioptions-=m " remove menu
  set guioptions-=T " remove toolbar
endif

set nu
set nornu
" toggle relativenumber
map <leader>rn :set rnu! rnu?<CR>
set ruler
set cmdheight=2
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
set wildmenu
set laststatus=2
set showmode
set showcmd
set cursorcolumn
set cursorline
set bg=dark
" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
set guifont=Operator_Mono_Bold:h16:cANSI:qDRAFT
" map <leader>l :set list!<CR> "Toggle tabs and EOL

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Rendering
set ttyfast

" Color scheme (terminal)
" set t_Co=256
" set background=dark
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1

" -----Mappings-----
" Quickly edit/reload config
map <leader>ev :e $MYVIMRC<CR>
map <leader>sv :so $MYVIMRC<CR>

" Searching
map <leader>/ :set hlsearch! hlsearch?<cr> " toggle search

" Buffers
map <leader>b :ls<CR>:buffer<Space>
map <leader>sb :ls<CR>:sbuffer<Space>

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Formatting
map <leader>q gqip

" Moving between current line
nmap H 0
nmap L $

" Window Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Window Resizing
" maximize window
nnoremap <C-W>M <C-W>\| <C-W>_
" minimize window
nnoremap <C-W>m <C-W>=

" -----Plugin Remappings-----
nmap <leader>nt :NERDTreeToggle<CR>

" -----Plugin Settings-----
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" -----Autocommands-----
" NOTE: we must escape spaces in the commands
augroup linters
	au FileType javascript setlocal formatprg=prettier\ --stdin\ --stdin-filepath\ %
	au FileType javascript.jsx setlocal formatprg=prettier\ --stdin\ --stdin-filepath\ %
	au FileType typescript setlocal formatprg=prettier\ --parser\ typescript\ --stdin\ --stdin-filepath\ %
	au FileType html setlocal formatprg=prettier\ --parser\ html\ --stdin\ --stdin-filepath\ %
	au FileType scss setlocal formatprg=prettier\ --parser\ css\ --stdin\ --stdin-filepath\ %
	au FileType css setlocal formatprg=prettier\ --parser\ css\ --stdin\ --stdin-filepath\ %
augroup end

nnoremap gp :silent %!prettier --stdin --stdin-filepath %<CR>

augroup coc
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <C-E>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
augroup end

" -----PLUGINS-----
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'lifepillar/vim-solarized8'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install
" script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

" Initialize plugin system
call plug#end()

" NOTE: this must be the after the plug#end line
" Otherwise, it won't load the color themes on startup
" https://github.com/altercation/vim-colors-solarized/issues/104#issuecomment-210934598
colorscheme solarized8_high
set bg=dark
