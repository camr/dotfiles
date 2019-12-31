"----------------------------------------------------------
"  __   _(_)_ __ ___  _ __ ___
"  \ \ / / | '_ ` _ \| '__/ __|
"   \ V /| | | | | | | | | (__
"  (_)_/ |_|_| |_| |_|_|  \___|
"
"
" File: $HOME/.vimrc
" Source: http://github.com/camr/dotfiles/tree/master/vim
" Author: Cameron Rivers <cameron.rivers@gmail.com>
"----------------------------------------------------------

" Compatibility mode breaks several plugins
if &compatible
  set nocompatible
endif

"----------------------------------------------------------
" System specific settings
"----------------------------------------------------------

let $GOPATH = $HOME."/Golang"
let g:go_bin_path = $HOME."/Golang/bin"

set shell=zsh\ -l

"----------------------------------------------------------
" Auto Installation
"----------------------------------------------------------
if empty(glob("~/.vim/autoload/plug.vim"))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  auto VimEnter * PlugInstall
endif

if !empty(glob("~/.fzf/bin/fzf"))
  if empty(glob("~/.fzf/bin/rg"))
    silent !curl -fLo /tmp/rg.tar.gz
          \ https://github.com/BurntSushi/ripgrep/releases/download/0.4.0/ripgrep-0.4.0-x86_64-unknown-linux-musl.tar.gz
    silent !tar xzvf /tmp/rg.tar.gz --directory /tmp
    silent !cp /tmp/ripgrep-0.4.0-x86_64-unknown-linux-musl/rg ~/.fzf/bin/rg
  endif
endif

if empty(glob("~/.vim/colors/lucius.vim"))
  silent !curl -fLo ~/.vim/colors/lucius.vim --create-dirs
        \ https://raw.githubusercontent.com/bag-man/dotfiles/master/lucius.vim
endif

if !isdirectory($HOME . "/.vim/undodir")
  call mkdir($HOME . "/.vim/undodir", "p")
endif

"----------------------------------------------------------
" Notes and things.
"----------------------------------------------------------

" NeoBundleLazy 'cwoac/nvim'
" NeoBundleLazy 'vimoutliner/vimoutliner'
" NeoBundleLazy 'wakatime/vim-wakatime'


"----------------------------------------------------------
" Appearance
"----------------------------------------------------------
syntax on
set number relativenumber
set nowrap

" colorscheme lucius
" LuciusDarkLowContrast

set cindent
set expandtab
set shiftwidth=2
set softtabstop=2

set laststatus=2
set statusline=%F
set wildmenu
set showcmd

match Delimiter /\d\ze\%(\d\d\%(\d\{3}\)*\)\>/

"----------------------------------------------------------
""" Key modifiers
"----------------------------------------------------------
nnoremap J :tabprev<CR>
nnoremap K :tabnext<CR>

"----------------------------------------------------------
""" Behaviour modifiers
"----------------------------------------------------------
let mapleader=" "

set autoindent          " Let ViM indent code
set autoread            " Reload files when changed on disk (e.g. `git checkout ...`)
set autowriteall        " Automatically save current file when another command is executed
set encoding=utf-8      " Default encoding to UTF-8
set guioptions=eg       " No GUI cruft
set hidden              " Allows open (but hidden) files
set history=1000        " Remember last 1000 commands
set modeline            " Enable modeline
set noerrorbells        " Keep ViM quiet
set number              " Show line numbers in the gutter
set linespace=3         " Give some space between lines
set ls=2                " Always show status line
set mouse=a             " Enable mouse integration in all modes
set ruler               " Show line and column numbers
set showcmd             " Show the command on the bottom line
set showmatch           " Match brackets
set showmode            " Show current mode
set smartindent         "
set undolevels=1000     " Allow 1000 undoes
set visualbell          " Flash the window

"----------------------------------------------------------
" stop setting term title!
"----------------------------------------------------------
let &titleold=""

" Folding
set foldmethod=indent
set foldlevel=99

set undofile
set clipboard=unnamed
set foldmethod=marker
set backspace=indent,eol,start

set backup
set noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
" set viminfo+=n$HOME/.vim/tmp/viminfo

" Create temp directory structure
silent! call SafeMakeDirP(&undodir)
silent! call SafeMakeDirP(&backupdir)
silent! call SafeMakeDirP(&directory)

set ignorecase          " Don't worry about case when searching
set smartcase           " Only care about case when explicitly set
set incsearch           " Incremental searching
set hlsearch            " Search highlighting

nnoremap <leader>, :let @/=''<CR> " Cancel search with <leader>,

set wildmenu
set wildmode=list:longest,full
set wildignore+=*.sw?                                      " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~                " Backup files
set wildignore+=*.jar,*.class                              " Java archives
set wildignore+=*.pyc                                      " Python byte code

set completeopt=longest,menuone
setlocal spell spelllang=en
set nospell
autocmd FileType gitcommit setlocal spell

set expandtab                          " Spaces instead of tabs
set shiftwidth=2                       " Two spaces for auto-indent
set softtabstop=2                      " A soft-tab of two spaces
set tabstop=2                          " A tab = two spaces

let g:DeleteTrailingWhitespace = 1
set listchars=tab:\ \ ,trail:·,extends:↷,precedes:↶
let &showbreak='↪ '
set linebreak
set list

"----------------------------------------------------------
" Window movement.
"----------------------------------------------------------
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>

nnoremap <leader><TAB> <C-w><C-w>
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h

nnoremap <leader>J <C-w>J
nnoremap <leader>K <C-w>K
nnoremap <leader>L <C-w>L
nnoremap <leader>H <C-w>H

"----------------------------------------------------------
" Plugins
"----------------------------------------------------------

" NERDTree
nmap <leader>t :execute 'NERDTreeToggle ' . getcwd()<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeBookmarksFile=expand("~/.vim/NERDTreeBookmarks")
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.o$', '^\.git$', 'node_modules']
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=0
let NERDTreeChDirMode=2
let g:NERDTreeDirArrowExpandable = '├'
let g:NERDTreeDirArrowCollapsible = '└'
let g:NERDTreeMapActivateNode = '<tab>'

" set mouse=a

" Ctrl-P
nnoremap <silent> <leader>p :CtrlP<CR>
nnoremap <silent> <leader>P :ClearCtrlPCache<CR>\|:CtrlP<CR>

let g:ctrlp_map = '<leader>p'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|\v[\/](node_modules)\|\.DS_Store|\.git\'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -U -g ""'

" Ale
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'go': ['gometalinter', 'goimports']
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\}

let g:ale_javascript_eslint_executable = 'eslint_d'
" let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_prettier_eslint_executable = 'prettier_d'
" let g:ale_javascript_prettier_eslint_use_global = 1

nmap ss :set spell!<CR>

" Fix JS files on save
" autocmd BufWritePre *.js execute 'call ESLintFix()'

" rainbow brackets
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" Commentary
nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

" Golang
function! VimGoSetup()
  " vim-go related mappings
  au FileType go nmap <Leader>r <Plug>(go-run)
  au FileType go nmap <Leader>b <Plug>(go-build)
  au FileType go nmap <Leader>t <Plug>(go-test)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <Leader>s <Plug>(go-implements)
  au FileType go nmap <Leader>c <Plug>(go-coverage)
  au FileType go nmap <Leader>e <Plug>(go-rename)
  au FileType go nmap <Leader>gi <Plug>(go-imports)
  au FileType go nmap <Leader>gI <Plug>(go-install)
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
  au FileType go nmap <Leader>ds <Plug>(go-def-split)
  au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dt <Plug>(go-def-tab)

  let g:go_auto_type_info = 1
  let g:go_fmt_command = "goimports"
  let g:go_fmt_experimental = 1
  let g:go_dispatch_enabled = 0 " vim-dispatch needed
  let g:go_metalinter_autosave = 0
  let g:go_metalinter_autosave_enabled = ['vet', 'golint']
  let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
  let g:go_term_enabled = 0
  let g:go_term_mode = "vertical"
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_interfaces = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_chan_whitespace_error = 1
endfunction
call VimGoSetup()


call plug#begin('~/.vim/plugged')
filetype plugin indent on

"----------------------------------------------------------
" Features
"----------------------------------------------------------
Plug 'w0rp/ale'                                                      " Async linting
Plug 'scrooloose/nerdtree'                                           " File tree browser
Plug 'Xuyuanp/nerdtree-git-plugin'                                   " Git for NerdTree
Plug 'jistr/vim-nerdtree-tabs'                                       " NerdTree independent of tabs
Plug 'ctrlpvim/ctrlp.vim'                                            " Ctrl-P for Vim

"----------------------------------------------------------
" Languages
"----------------------------------------------------------
Plug 'moll/vim-node'                                                 " Syntax for node.js
Plug 'othree/html5.vim'                                              " HTML5 formatting
Plug 'othree/yajs.vim'                                               " Yet Another JS Syntax
Plug 'othree/es.next.syntax.vim'                                     " Support for ES Next syntax
Plug 'othree/javascript-libraries-syntax.vim'                        " Syntax for various javascript libs
Plug 'elzr/vim-json'                                                 " JSON
Plug 'leafgarland/typescript-vim'                                    " Typescript
Plug 'posva/vim-vue'                                                 " Vue
Plug 'fatih/vim-go'                                                  " Golang

"----------------------------------------------------------
" Snippets
"----------------------------------------------------------
Plug 'isRuslan/vim-es6'                                              " ES6 snippets
Plug 'bag-man/snipmate-mocha'                                        " Snippets for Mocha tests

"----------------------------------------------------------
" tpope
"----------------------------------------------------------
Plug 'tpope/vim-surround'                                            " Operate on surrounding
Plug 'tpope/vim-repeat'                                              " Repeat plugins
Plug 'tpope/vim-commentary'                                          " Comment out blocks
Plug 'tpope/vim-fugitive'                                            " Git integration

"----------------------------------------------------------
" Syntastic
"----------------------------------------------------------
" Plug 'vim-syntastic/syntastic'                                       " Syntastic
" Plug 'sekel/vim-vue-syntastic'                                       " Vue

"----------------------------------------------------------
" Linters
"----------------------------------------------------------
" Plug 'josudoey/vim-eslint-fix'                                       " Eslint fixamajig
" Plug 'crahles/vim-gometalinter.vim'                                  " Gometalinter integration

"----------------------------------------------------------
" Appearance
"----------------------------------------------------------
Plug 'mkitt/tabline.vim'                                             " Cleaner tabs
Plug 'chrisbra/Colorizer'                                            " Show hex codes as colours
Plug 'kien/rainbow_parentheses.vim'                                  " Colour matched brackets
Plug 'suan/vim-instant-markdown'                                     " Markdown preview instant-markdown-d
Plug 'unblevable/quick-scope'                                        " Highlight jump characters
Plug 'junegunn/goyo.vim'                                             " Distraction free writing
Plug 'arcticicestudio/nord-vim'                                      " Nord color theme

"----------------------------------------------------------
" Text Manipulation
"----------------------------------------------------------
Plug 'vim-scripts/DeleteTrailingWhitespace'                          " Automatically delete trailing whitespace
Plug 'Raimondi/delimitMate'                                          " Autocompletion of (, [, {, ', ", ...
Plug 'Valloric/MatchTagAlways'                                       " Highlight matching tags
Plug 'vim-scripts/closetag.vim'                                      " Ctrl-_ to auto-close html tags

call plug#end()

"----------------------------------------------------------
" Editing this file.
"----------------------------------------------------------

" Quickly edit and reload .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Autoload vim configuration when file changes
autocmd! BufWritePost vimrc source %

" Clear poorly set sign column
" NOTE: Must be the last(?) line of the file.
hi clear SignColumn
