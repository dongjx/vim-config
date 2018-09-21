" Annie's vimrc
" @author: Annie Dong

" use vundle manage plugin
" https://github.com/VundleVim/Vundle.vim
" step1: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" step2: intall plugin: :PluginInstall

syntax on
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" show filesystem in tree
Plugin 'scrooloose/nerdtree'
" A code searching tool
Plugin 'rking/ag.vim'
" a source code browser
Plugin 'vim-scripts/taglist.vim'
" Git command integrate
Plugin 'tpope/vim-fugitive'
" auto complete
Plugin 'vim-scripts/AutoComplPop'
" align code
Plugin 'vim-scripts/Align'
" check syntastic
Plugin 'scrooloose/syntastic'
" auto complete quotes etc.
Plugin 'Raimondi/delimitMate'
" shows a git diff in the gutter
Plugin 'airblade/vim-gitgutter'
" browse the tags of the current file
Plugin 'majutsushi/tagbar'
" create better-looking, more functional vim statuslines
Plugin 'Lokaltog/vim-powerline'
" syntax highlight
Plugin 'tpope/vim-rails'
" Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'nono/jquery.vim'
Plugin 'jelera/vim-javascript-syntax'
" Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'vim-scripts/nginx.vim'

" colorscheme
Plugin 'jpo/vim-railscasts-theme'
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " load filetype-specific indent files
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Leader Shortcuts
let mapleader=','           " leader is comma

" Plugin config
"
" " scrooloose/nerdtree
" autocmd vimenter * NERDTree             " open a NERDTree automatically when vim starts up
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Show hidden files in NerdTree
let NERDTreeShowHidden=1
map <leader>n :NERDTreeToggle<CR>

" " rking/ag.vim
" open ag.vim
nnoremap <leader>a :Ag
nnoremap <leader>A :AgFile

" " vim-scripts/taglist.vim
" set tags file
set tags=./.tags,.tags;
" exit vim when taglist is the last window
let Tlist_Exit_OnlyWindow=1
" open taglish use ,t
nnoremap <leader>t :TlistToggle<CR>
" generate ctags
nmap <silent><F4> :!ctags -f ./.tags -R *<CR>

" " vim-scripts/Align
map <silent><F2> :Align =<cr>

" " scrooloose/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" show the syntastic error list
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0                 " check syntax when wq
let g:syntastic_check_on_open=1                 " check syntax when open a file

" a good resource: http://dougblack.io/words/a-good-vimrc.html

" Base
set encoding=utf-8

" Colors
set t_Co=256
syntax enable               " enable syntax processing
" set bg=dark
colorscheme tomorrow-night  " awesome colorscheme

" Spaces & Tabs
set tabstop=2       	    	" number of visual spaces per TAB
set softtabstop=2   	    	" number of spaces in tab when editing
set expandtab       	    	" tabs are spaces
set backspace=indent,eol,start


" UI Config
set number              	  " show line numbers
set showcmd             	  " show command in bottom bar
set cursorline              " highlight current line
set wildmenu                " visual autocomplete for command menu
set lazyredraw              " redraw only when we need to
set showmatch               " highlight matching [{()}]
set smartindent             " auto indentation
set shiftwidth=2            " normal mode indentation commands use 2 spaces
set noswapfile              " not save swap file
set laststatus=2            " always show statusline
set ruler                   " show where you are
set scrolloff=3             " show context above/below cursorline
" show blank
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Searching
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set ignorecase              " ignore case when searching
" turn off search highlight
nnoremap <leader>s :nohlsearch<CR>

" Turn paste off/on
set pastetoggle=<F10>


" Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" highlight last inserted text
nnoremap <leader>v `[v`]
" delete blank of the line end
nnoremap <silent><f12> :%s/[ \t\r]\+$//g<cr>
" replace tag to 4 blank
nnoremap <leader>B :%s/\t/    /g<cr>
" use ,e as esc
inoremap <leader>e <esc>
" enable/disable mouse
nnoremap <leader>m :set mouse=a<cr>
nnoremap <leader>M :set mouse=c<cr>
