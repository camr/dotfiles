"----------------------------------------
" File: $HOME/.vimrc
" Author: Cameron Rivers <cameron.rivers@gmail.com>
"----------------------------------------


"----------------------------------------
" Standard Stuff
"----------------------------------------

set nocompatible        " Disable vi compatibility
set history=500         " Remember last 500 commands
set undolevels=500      " Allow 500 undoes
set ruler               " Show line and column numbers
set number              " Show line numbers in the gutter
" set relativenumber      " Gutter shows relative line numbers
set hidden              " Allows open (but hidden) files

" stop setting term title!
let &titleold=""

" Folding
set foldmethod=indent
set foldlevel=99

" Change mapleader to , (normally \)
let mapleader=","

" Set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Temporary Files
set nobackup            " Stop creating backup files
set noswapfile          " Don't bother creating swap files


" Searching
set ignorecase          " Don't worry about case when searching
set smartcase
set incsearch           " Incremental searching
set hlsearch            " Search highlighting

"nnoremap / /\v          " Change searching to use normal
"vnoremap / /\v          " regexes, not Vim weirdo defaults

" Cancel search with ,<space>
nnoremap <leader><space> :let @/=''<CR>

set visualbell          " Flash the window
set noerrorbells        " Keep ViM quiet

set title               " Change the terminal's title
set background=dark     " Let ViM know we use a dark color scheme

" 4 spaces for tabs, et al.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set showcmd             " Show the command on the bottom line
set showmatch           " Match brackets
set showmode            " Show current mode
set modeline            " Enable modeline
set autoindent          " Let ViM indent code
set smartindent
set autowrite           " Automatically save curre11/01/2010nt file when another command is executed

set guioptions=eg       " No GUI cruft
set guifont=Inconsolata:h14     " Wonderful font

colorscheme torte

set backspace=indent,eol,start  " Allow sane backspacing

set listchars=tab:»·,trail:·,extends:#,nbsp:.    " Show important whitespace
set list

" set foldenable
" set foldmethod=indent

set wildmode=list:longest       " Tab completion in command-mode
set wildignore=*.pyc,*.swp,*.bak,*.class,cache/**
set wildchar=<TAB>
set wildmenu

syntax on               " Enable syntax highlighting

" highlight end of line whitespace
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" highlight long lines
" highlight LongLine guibg=green ctermbg=green
" match LongLine /\%99v.\+/

" start in fanforce
:cd /Volumes/tippr.test/fanforce


" Call pathogen to automatically load vim plugins
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


"----------------------------------------
" Abbreviations
"----------------------------------------

" Name and email
ab cr Cameron Rivers <cameron.rivers@gmail.com>


"----------------------------------------
" Key mapping
"----------------------------------------

" CTRL-s to save the frikkin' file
imap <C-s> <ESC>:w<CR>a
map <C-s> <ESC>:w<CR>

" CTRL+<movement> between windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" NERDTree
nmap <leader>n :execute 'NERDTreeToggle ' . getcwd()<CR>

let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.o$', '^\.git$']

let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1

" Quickly edit and reload .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" TaskList
map <leader>l :TaskList<CR>
map <leader>o :CommandT<CR>
" map <leader>p :TlistToggle<CR>

" Gundo
map <leader>g :GundoToggle<CR>

" PEP 8
let g:pep8_map='<leader>8'

" SuperTab
let g:SuperTabDefaultCompletionType="context"
set completeopt=menuone,longest,preview

" CoffeeScript settings

" Automatically compile CoffeeScript files on save
" ZOMG.coffee -> ZOMG.js
" let coffee_compile_on_save = 1


"----------------------------------------
" Python stuff
"----------------------------------------
" `gf` jumps to the filename under the cursor
" python << EOF
" import os
" import sys
" import vim
" for p in sys.path:
    " if os.path.isdir(p):
        " vim.command(r"set path+= %s" % (p.replace(" ", r"\ ")))
" EOF

" :make to see syntax errors. (:cn and :cp to move around, :dist to see all
" errors)
set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile(r'%')\"
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m


" py.test integration
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

"----------------------------------------
" File handlers
"----------------------------------------

filetype on
filetype plugin on
filetype indent on

autocmd BufReadPre,FileReadPre    *.py set expandtab

autocmd BufNewFile,BufRead        *.ldg,*.ledger setf ledger

autocmd BufNewFile,BufRead        *.coffee setf coffee

autocmd BufNewFile,BufRead        *.jade setf jade


autocmd filetype html,xml set listchars-=tab:»·

autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:pydiction_location = "/Users/camr/.vim/vimfiles/ftplugin/pydiction/complete-dict"
inoremap <Nul> <C-x><C-o>

" Save when tabbing away from Vim
" autocmd FocusLost * :wa

" Set the statusline
set statusline=%t\ %{fugitive#statusline()}\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %h%m%r%y%=%c,%l/%L\ %P
set laststatus=2
