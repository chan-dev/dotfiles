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
set rtp+=~/.fzf
let mapleader = ","

" Encoding
set encoding=utf-8

" Linters
" set pyxversion=3
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Note change this path when you switch nvm environment
let g:ale_javascript_eslint_executable ='/home/chan-dev/.nvm/versions/node/v14.3.0/bin/npm/.bin/eslint'
let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_linters = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint'],
      \   'jsx': ['eslint'],
      \}
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint'],
      \   'jsx': ['eslint'],
      \}

" Fuzzy searching
nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <C-f> :Rg<cr>
" https://github.com/junegunn/fzf.vim/issues/346#issuecomment-288483704
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Jump between errors
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

" General Configurations
set nospell
map <leader>st :set spell!<CR>
set history=1000
set autoread
set noerrorbells
set visualbell " flash the screen instead of beeping on errors
set mouse=a
set title
set nomodeline " security measure
" set pythonthreedll=python37.dll

set omnifunc=ale#completion#OmniFunc

" Swap/Backup
set noswapfile
set nobackup
set nowb
set directory=/tmp

" Whitespace & Indentation
set nowrap
set textwidth=78
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
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

set number
set norelativenumber
" toggle relativenumber
map <leader>tr :set rnu! rnu?<CR>
set ruler
" don't give |ins-completion-menu| messages.
set wildmenu
set laststatus=2
set showmode
set showcmd
set cursorcolumn
set cursorline
set lazyredraw " will not redraw the screen while running macros
set bg=dark
" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
set guifont=Operator_Mono_Medium:h16:cANSI:qDRAFT
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

" Menu compilation (from vim-opinion repo)
set wildmenu                    "wmnu:  enhanced ed command completion
set wildignore+=*.~             "wig:   ignore compiled objects and backups
set wildignore+=*.o,*.obj,*.pyc
set wildignore+=.sass-cache,tmp
set wildignore+=node_modules
set wildignore+=log,logs
set wildignore+=vendor
set wildmode=longest:full,list:full

" Color scheme (terminal)
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='badwolf'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" Nerdtree
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" vim remaps <C-/> to <C-_> but we still use CTRL+/ for this mapping
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" -----Mappings-----
" Quickly edit/reload config
map <leader>ev :tabe $MYVIMRC<CR>
map <leader>sv :so $MYVIMRC<CR>

" Searching
map <leader>/ :set hlsearch! hlsearch?<cr>

" Git
" :tab <cmd> - execute a cmd in new tab
nnoremap <leader>gs :tab Gstatus<cr>
nnoremap <leader>gl :tab GV!<cr> " log for current file
nnoremap <leader>gL :tab GV<cr> " log all
nnoremap <leader>gd :tab Gvdiff<cr>
nnoremap <leader>gc :tab Gvdiffsplit!<cr>
nmap ]j <Plug>(GitGutterNextHunk)
nmap ]k <Plug>(GitGutterPrevHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" Buffers
map <leader>b :ls<CR>:buffer<Space>
map <leader>sb :ls<CR>:sbuffer<Space>

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Formatting
map <leader>q gqip

" Moving between current line
nnoremap H ^
nnoremap L $

" commandline mode mappings
cnoremap <C-h> <Home>
cnoremap <C-l> <End>

" Window Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tab Navigation
nnoremap <C-t> :tabnew<cr>

" Window Resizing
" maximize window
nnoremap <C-W>M <C-W>\| <C-W>_
" minimize window
nnoremap <C-W>m <C-W>=

" -----Plugin Remappings-----
nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

" -----Plugin Settings-----
" let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" -----Coc Specific Settings-----
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-eslint',
  \ 'coc-html',
  \ 'coc-css',
  \ ]
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent><expr> <NUL> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Snippets
imap <C-l> <Plug>(coc-snippets-expand)
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" NOTE: we must escape spaces in the commands

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" ---AUTOCOMMANDS---

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

augroup ntree
" sync open file with NERDTree
" " Check if NERDTree is open or active
let g:NERDTreeIgnore = ['^node_modules$']
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
" function! SyncTree()
"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"     NERDTreeToggle
"     wincmd p
"   endif
" endfunction

" " Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()
augroup end

" Prefix all commands with Fz,
" " so Files is Fzfiles, Rg is FzRg, etc.
" " It's useful to autocomplete all fzf commands using :Fz<tab>
" let g:fzf_command_prefix = 'Fz'
"
" " Keeps the history of previous searches.
" " You can use ctrl-n or ctr-p to navigate the history on a FZF window
let g:fzf_history_dir = '~/.local/share/fzf-history'

" -----PLUGINS-----
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'lifepillar/vim-solarized8'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'posva/vim-vue'
Plug 'editorconfig/editorconfig-vim'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install
" script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

" NOTE: this must be the after the plug#end line
" Otherwise, it won't load the color themes on startup
" https://github.com/altercation/vim-colors-solarized/issues/104#issuecomment-210934598
colorscheme solarized8_high
set bg=dark
