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
set nocompatible

"----------------------------------------------------------
" System specific settings
"----------------------------------------------------------

let $GOPATH = $HOME."/go"
let g:go_bin_path = $HOME."/go/bin"

"----------------------------------------------------------
" Set up NeoBundle
"----------------------------------------------------------

" Install NeoBundle if it is not available
let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p $HOME/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
endif

" Call NeoBundle
if has('vim_starting')
  set rtp+=$HOME/.vim/bundle/neobundle.vim
endif

let g:neobundle#types#git#default_protocol = 'git'
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage itself
NeoBundleFetch 'Shougo/neobundle.vim'

"----------------------------------------------------------
" Install plugins managed by NeoBundle
"----------------------------------------------------------

" Vimproc asynchronously runs commands.
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \   'windows' : 'make -f make_mingw32.mak',
  \   'cygwin'  : 'make -f make_cygwin.mak',
  \   'mac'     : 'make -f make_mac.mak',
  \   'unix'    : 'make -f make_unix.mak',
  \ },
  \}

"----------------------------------------------------------
" Install Unite, unite sources and plugins.
"----------------------------------------------------------

" Unite. The interface to rule most everything.
" NeoBundle 'Shougo/unite.vim'

" Unite sources.
" NeoBundleLazy 'Shougo/unite-outline', {'autoload': {'unite_sources': 'outline'}}
" NeoBundleLazy 'tsukkee/unite-help', {'autoload': {'unite_sources': 'help'}}
" NeoBundleLazy 'thinca/vim-unite-history', {'autoload': {'unite_sources':
  " \ ['history/command', 'history/search']}}
" NeoBundleLazy 'osyo-manga/unite-filetype', {'autoload': {'unite_sources': 'filetype'}}
" NeoBundleLazy 'osyo-manga/unite-fold', {'autoload': {'unite_sources': 'fold'}}
" NeoBundleLazy 'tacroe/unite-mark', {'autoload': {'unite_sources': 'mark'}}

" Unite plugin to provide command line completion.
" NeoBundle 'majkinetor/unite-cmdmatch'

"----------------------------------------------------------
" Install colorscheme.
"----------------------------------------------------------

NeoBundleLazy 'stephenmckinney/vim-solarized-powerline', {'autoload': {'unite_sources': 'colorscheme'}}

"----------------------------------------------------------
" Git related plugins.
"----------------------------------------------------------

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundleLazy 'gregsexton/gitv', {'depends': ['tpope/vim-fugitive'],
  \ 'autoload': {'commands': 'Gitv'}}

"----------------------------------------------------------
" File traversal.
"----------------------------------------------------------

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'rking/ag.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'majutsushi/tagbar'

"----------------------------------------------------------
" Snippets plugins.
"----------------------------------------------------------

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

"----------------------------------------------------------
" Language syntaxes.
"----------------------------------------------------------

NeoBundleLazy 'elixir-lang/vim-elixir', {'filetypes': 'elixir'}
NeoBundleLazy 'derekwyatt/vim-scala', {'filetypes': 'scala'}
NeoBundleLazy 'fatih/vim-go', {'filetypes': 'go'}
NeoBundleLazy 'cespare/vim-go-templates', {'filetypes': 'gotplhtml'}
NeoBundleLazy 'othree/html5.vim', {'filetypes': 'html'}
NeoBundleLazy 'elzr/vim-json', {'filetypes': 'json'}
NeoBundleLazy 'groenewege/vim-less', {'filetypes': 'less'}
NeoBundleLazy 'digitaltoad/vim-jade', {'filetypes': 'jade'}
NeoBundleLazy 'gre/play2vim', {'filetypes': ['play2-html', 'play2-routes', 'play2-conf']}
NeoBundleLazy 'tpope/vim-markdown', {'filetypes': '.md'}
NeoBundleLazy 'nelstrom/vim-markdown-folding'

NeoBundle 'scrooloose/syntastic'

"----------------------------------------------------------
" Linters
"----------------------------------------------------------

NeoBundleLazy 'crahles/vim-gometalinter.vim'

"----------------------------------------------------------
" Notes and things.
"----------------------------------------------------------

NeoBundleLazy 'cwoac/nvim'
NeoBundleLazy 'vimoutliner/vimoutliner'
NeoBundleLazy 'wakatime/vim-wakatime'

"----------------------------------------------------------
" Text helpers.
"----------------------------------------------------------

" Allow easy removal of trailing whitespace
NeoBundle 'vim-scripts/DeleteTrailingWhitespace'

" Autocompletion of (, [, {, ', ", ...
NeoBundle 'delimitMate.vim'

" Quick editing of surrounding characters
NeoBundle 'tpope/vim-surround'

" Extend repetitions by the '.' key
NeoBundle 'tpope/vim-repeat'

" Comment toggling
NeoBundle 'tpope/vim-commentary'

" Undo tree traversal
NeoBundleLazy 'sjl/gundo.vim', {'autoload': {'commands': 'GundoToggle'}}

" Better marks
NeoBundle 'kshenoy/vim-signature'

" Easy word movement
NeoBundle 'Lokaltog/vim-easymotion'

" Autocompletion
NeoBundle 'Valloric/YouCompleteMe'

"----------------------------------------------------------
" HTML/CSS
"----------------------------------------------------------

" NeoBundleLazy 'mattn/emmet-vim', {'autoload':
"   \ {'filetypes': ['html', 'xhttml', 'css', 'xml', 'xls', 'markdown']}}

NeoBundle 'Valloric/MatchTagAlways'

NeoBundle 'vim-scripts/closetag.vim'

NeoBundle 'kchmck/vim-coffee-script', {'autoload': {
  \ 'commands': [
  \   'CoffeeCompile', 'CoffeeLint', 'CoffeeMake',
  \   'CoffeeRun', 'CoffeeWatch'],
  \ 'filetypes': ['coffee']
  \ }}

"----------------------------------------------------------
" GUI
"----------------------------------------------------------

NeoBundle 'bling/vim-airline'
NeoBundleLazy 'vim-scripts/zoomwintab.vim', {'autoload': {'commands': 'ZoomWinTabToggle'}}

"----------------------------------------------------------
" SuperTab
"----------------------------------------------------------

NeoBundle 'ervandew/supertab'

"----------------------------------------------------------
" Sessions
"----------------------------------------------------------

NeoBundleLazy 'xolox/vim-misc'
NeoBundleLazy 'xolox/vim-session'


"----------------------------------------------------------
" Begin plugin installation
"----------------------------------------------------------

call neobundle#end()

" Turn indentation and plugins by filetype on
filetype plugin indent on

NeoBundleCheck

"----------------------------------------------------------
" VIM setup
"----------------------------------------------------------

" Change mapleader to ' ' (normally \)
let mapleader=" "

set autoindent          " Let ViM indent code
set autoread            " Reload files when changed on disk (e.g. `git checkout ...`)
set autowriteall        " Automatically save current file when another command is executed
set backspace=indent,eol,start  " Allow sane backspacing
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
set spell spelllang=en_us
set nospell
" set title               " Change the terminal's title
set undolevels=1000     " Allow 1000 undoes
set visualbell          " Flash the window

" stop setting term title!
let &titleold=""

" Folding
set foldmethod=indent
set foldlevel=99

"----------------------------------------------------------
" Searching.
"----------------------------------------------------------

set ignorecase          " Don't worry about case when searching
set smartcase           " Only care about case when explicitly set
set incsearch           " Incremental searching
set hlsearch            " Search highlighting

" Cancel search with <leader>,
nnoremap <leader>, :let @/=''<CR>

"----------------------------------------------------------
" Backup files.
"----------------------------------------------------------

function! SafeMakeDirP(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), "p")
  endif
endfunction

set backup
set noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set viminfo+=n$HOME/.vim/tmp/viminfo/

" Create temp directory structure
silent! call SafeMakeDirP(&undodir)
silent! call SafeMakeDirP(&backupdir)
silent! call SafeMakeDirP(&directory)

"----------------------------------------------------------
" Wildmenu, command-line autocompletion.
"----------------------------------------------------------

set wildmenu
set wildmode=list:longest,full

set wildignore+=*.sw?                                      " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~                " Backup files
set wildignore+=*.jar,*.class                              " Java archives
set wildignore+=*.pyc                                      " Python byte code

"----------------------------------------------------------
" Tabs, spaces and wrapping.
"----------------------------------------------------------

set expandtab                          " Spaces instead of tabs
set shiftwidth=2                       " Two spaces for auto-indent
set softtabstop=2                      " A soft-tab of two spaces
set tabstop=2                          " A tab = two spaces

"----------------------------------------------------------
" Font and colorscheme.
"----------------------------------------------------------

syntax enable                          " Enable syntax highlighting
set background=dark                    " Let ViM know we use a dark color scheme
set t_Co=256                           " 256 colors in terminal

if has("gui_running")
  colorscheme solarized
  set guifont=Source\ Code\ Pro\ for\ Powerline:h11
endif

"----------------------------------------------------------
" Whitespace and hidden characters.
"----------------------------------------------------------

" Don't automatically delete on writing a buffer.
let g:DeleteTrailingWhitespace = 0
" Do this to fix trailing whitespace.
noremap <silent> <Leader>d<space> :DeleteTrailingWhitespace<CR>

" Show important whitespace.
set listchars=tab:\ \ ,trail:·,extends:>,precedes:.
let &showbreak = '> '
set linebreak
set list

"----------------------------------------------------------
" Toggle line numbers.
"----------------------------------------------------------

set number
set relativenumber

nnoremap <Leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if !&number && !&relativenumber
      set number
      set norelativenumber
  elseif &number && !&relativenumber
      set nonumber
      set relativenumber
  elseif !&number && &relativenumber
      set number
      set relativenumber
  elseif &number && &relativenumber
      set nonumber
      set norelativenumber
  endif
endfunction

"----------------------------------------------------------
" Vim Airline
"----------------------------------------------------------

let g:airline_theme = "luna"
let g:airline_extensions_branch_enabled = 1
" let g:airline_enable_syntastic = 1
let g:airline_extensions_syntastic_enabled = 1
let g:airline_powerline_fonts=1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

"----------------------------------------------------------
" Commentary
"----------------------------------------------------------

nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

augroup plugin_commentary
    au!
    au FileType python setlocal commentstring=#\ %s
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType gotplhtml setlocal commentstring={{\/\*\ %s\ \*\/}}
augroup END

"----------------------------------------------------------
" delimitmate
"----------------------------------------------------------

let delimitMate_expand_space = 1

"----------------------------------------------------------
" Fugitive
"----------------------------------------------------------

" nnoremap <Leader>gn :Unite output:echo\ system("git\ init")<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>go :Gread<CR>
nnoremap <Leader>gR :Gremove<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gp :Git! push<CR>
nnoremap <Leader>gP :Git! pull<CR>
nnoremap <Leader>gi :Git!<Space>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gE :Gedit<Space>
" nnoremap <Leader>gl :exe "silent Glog <Bar> Unite -no-quit
"             \ quickfix"<CR>:redraw!<CR>
" nnoremap <Leader>gL :exe "silent Glog -- <Bar> Unite -no-quit
"             \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gt :!tig<CR>:redraw!<CR>
nnoremap <Leader>gS :exe "silent !shipit"<CR>:redraw!<CR>
nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite
            \ quickfix -no-quit<CR>
" nnoremap <Leader>ggm :exe 'silent Glog --grep='.input("Pattern: ").' <Bar>
"             \Unite -no-quit quickfix'<CR>
" nnoremap <Leader>ggt :exe 'silent Glog -S='.input("Pattern: ").' <Bar>
"             \Unite -no-quit quickfix'<CR>

nnoremap <Leader>ggc :silent! Ggrep -i<Space>

" for the diffmode
noremap <Leader>du :diffupdate<CR>

if !exists(":Gdiffoff")
    command Gdiffoff diffoff | q | Gedit
endif
noremap <Leader>dq :Gdiffoff<CR>

"----------------------------------------------------------
" Gundo
"----------------------------------------------------------

nnoremap <Leader>u :GundoToggle<CR>

let g:gundo_preview_bottom = 1

"----------------------------------------------------------
" YouCompleteMe
"----------------------------------------------------------

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"----------------------------------------------------------
" Ultisnips
"----------------------------------------------------------

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"----------------------------------------------------------
" Autocomplete
"----------------------------------------------------------

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#max_list = 30
let g:neocomplete#min_keyword_length = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#data_directory = expand('~/.vim/tmp/neocomplete')

" disable the auto select feature by default to speed up writing without
" obstacles (is optimal for certain situations)
let g:neocomplete#enable_auto_select = 0

" toggle the auto select feature
function! ToggleNeoComplete()
  if !g:neocomplete#disable_auto_complete && g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 0
  elseif !g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 1
      let g:neocomplete#enable_auto_select = 0
  elseif g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 1
  endif
endfunction
nnoremap <silent><Leader>ea :call ToggleNeoComplete()<CR>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.python='[^. \t]\.\w*'

"----------------------------------------------------------
" Syntastic
"----------------------------------------------------------

" Run Syntastic when opening files.
let g:syntastic_check_on_open = 1

nmap <silent><Leader>n :SyntasticCheck<CR>
nmap <silent><Leader>nn :lnext<CR>

let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['javascript'],
            \ 'passive_filetypes': [] }

let g:syntastic_javascript_checkers = ['jshint']

" let g:syntastic_error_symbol='✗'
" let g:syntastic_warning_symbol='⚠'
" let g:syntastic_style_error_symbol='✑'
" let g:syntastic_style_warning_symbol='✎'

"----------------------------------------------------------
" Unite
"----------------------------------------------------------

" let g:unite_source_history_yank_enable=1
" let g:unite_prompt = '>>> '
" let g:unite_marked_icon = '✓'
" call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Use unite for displaying ag search results
" let g:unite_source_grep_command = 'ag'
" let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden'
" let g:unite_source_grep_recursive_opt = ''
" let g:unite_source_grep_search_word_highlight = 1

" Accessing files
" nnoremap <Leader>f :Unite -toggle -buffer-name=files -start-insert file<CR>
" nnoremap <Leader>e :Unite -toggle -buffer-name=files -start-insert file_rec/async:!<CR>
" nnoremap <Leader>g :Unite -toggle -buffer-name=grep grep:%::<CR>
" nnoremap <Leader>y :Unite -toggle -buffer-name=yank register<CR>
" nnoremap <Leader>b :Unite -toggle -buffer-name=buffers buffer<CR>
" nnoremap <Leader>m :Unite -toggle -buffer-name=marks mark<CR>

" Custom mappings for the unite buffer
" autocmd FileType unite call s:unite_settings()
" function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  " imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  " imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
" endfunction

"----------------------------------------------------------
" NERDTree
"----------------------------------------------------------

nmap <leader>t :execute 'NERDTreeToggle ' . getcwd()<CR>

let NERDTreeBookmarksFile=expand("~/.vim/NERDTreeBookmarks")
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.o$', '^\.git$', 'node_modules']
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1

"----------------------------------------------------------
" TagBar
"----------------------------------------------------------

nmap <F8> :TagbarToggle<CR>

"----------------------------------------------------------
" Easy Motion
"----------------------------------------------------------

let g:EasyMotion_smartcase = 1

map s <Plug>(easymotion-s2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

"----------------------------------------------------------
" Match Tags Always
"----------------------------------------------------------

let g:mta_filetypes = {
  \ 'html': 1,
  \ 'xhtml': 1,
  \ 'gotplhtml': 1
  \}

nnoremap <leader>% :MtaJumpToOtherTag<CR>

"----------------------------------------------------------
" Ctrl-P
"----------------------------------------------------------

" Ctrl-P options
nnoremap <silent> <leader>p :CtrlP<CR>
nnoremap <silent> <leader>P :ClearCtrlPCache<CR>\|:CtrlP<CR>

let ctrlp_map = '<leader>p'
let ctrlp_match_window_bottom = 1
let ctrlp_match_window_reversed = 0
let ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|\v[\/](node_modules)\|DS_Store\'
let ctrlp_working_path_mode = 0
let ctrlp_dotfiles = 0
let ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -U -g ""'


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
" Abbreviations
"----------------------------------------------------------

" Name and email
ab cr Cameron Rivers <cameron.rivers@gmail.com>


"==========================================================
" Language specific settings.
"==========================================================


"----------------------------------------------------------
" File suffixes to filetype mappings.
"----------------------------------------------------------

au BufNewFile,BufRead *.tpl setlocal ft=gotplhtml
au BufNewFile,BufRead *.scala.html setlocal ft=play2-html

"----------------------------------------------------------
" CoffeeScript
"----------------------------------------------------------

let coffee_linter = "coffeelint"
let coffee_lint_options = "-f ~/.coffeelint.json"
nmap <silent> <leader>cl :CoffeeLint | cwindow

"----------------------------------------------------------
" JavaScript
"----------------------------------------------------------

augroup js_autocmd
  autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType javascript setlocal expandtab
augroup END

"----------------------------------------------------------
" LESS
"----------------------------------------------------------

augroup less_autocmd
  autocmd FileType less setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType less setlocal expandtab
augroup END

"----------------------------------------------------------
" Jade
"----------------------------------------------------------

augroup jade_autocmd
  autocmd FileType jade setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType jade setlocal expandtab
augroup END

"----------------------------------------------------------
" Python
"----------------------------------------------------------

let g:pydiction_location = $HOME."/.vim/vimfiles/ftplugin/pydiction/complete-dict"
" inoremap <Nul> <C-x><C-o>

augroup python_autocmd
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType python setlocal expandtab
augroup END

"----------------------------------------------------------
" Ruby
"----------------------------------------------------------

augroup ruby_autocmd
  autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType ruby setlocal noexpandtab
augroup END

"----------------------------------------------------------
" Go
"----------------------------------------------------------

let g:go_fmt_command = "goimports"

augroup go_autocmd
  autocmd FileType go setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType go setlocal noexpandtab
  autocmd FileType gotplhtml setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType gotplhtml setlocal expandtab
augroup END

" Run GoLint on file save
autocmd BufWritePost *.go GoLint

"----------------------------------------------------------
" Play 2.0 Framework
"----------------------------------------------------------

augroup play2_autocmd
  autocmd FileType play2-html set expandtab
  autocmd FileType play2-html setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

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


