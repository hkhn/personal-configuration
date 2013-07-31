"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Main part comes from Moolenaar's .vimrc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Jul 18
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" read/write a .viminfo file, don't store more than 50 lines of registers
set viminfo='20,\"50

" show the cursor position all the time
set ruler

set autoindent		" always set autoindenting on
set shiftwidth=2
set tabstop=2
set expandtab
"if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
"set incsearch		" do incremental searching
set nohlsearch

set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" color
set t_Co=256
colorscheme torte

set dict=/usr/share/dict/words

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

map <F1> <ESC>
map! <F1> <ESC>

" Don't use Ex mode, use Q for formatting
map Q gq

" some extra commands for HTML editing
nmap ,mh wbgueyei<<ESC>ea></<ESC>pa><ESC>bba
nmap ,h1 _i<h1><ESC>A</h1><ESC>
nmap ,h2 _i<h2><ESC>A</h2><ESC>
nmap ,h3 _i<h3><ESC>A</h3><ESC>
nmap ,h4 _i<h4><ESC>A</h4><ESC>
nmap ,h5 _i<h5><ESC>A</h5><ESC>
nmap ,h6 _i<h6><ESC>A</h6><ESC>
nmap ,hb wbi<b><ESC>ea</b><ESC>bb
nmap ,he wbi<em><ESC>ea</em><ESC>bb
nmap ,hi wbi<i><ESC>ea</i><ESC>bb
nmap ,hu wbi<u><ESC>ea</i><ESC>bb
nmap ,hs wbi<strong><ESC>ea</strong><ESC>bb
nmap ,ht wbi<tt><ESC>ea</tt><ESC>bb
nmap ,hx wbF<df>f<df>

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  if has("syntax")
    syntax on
  endif
"  set hlsearch
  if &term == "kon" || &term == "linux" || &term == "jfbterm"
    set bg=dark
  endif
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

if has("autocmd")
 augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For C and C++ files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd FileType *      set formatoptions=tcql nocindent comments&
  autocmd FileType c,cpp  set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
 augroup END
endif

if &term == "xterm"
     "set t_Co=8
     set t_Sb=^[4%dm
     set t_Sf=^[3%dm
endif

if $LANG =~ "ja.*"
  if has("multi_byte")
    " set encoding=euc-jp
    set encoding=utf-8
    " set termencoding=shift-jis
    set termencoding=utf-8
    set fileencodings=utf-8,euc-jp,iso-2022-jp,shift-jis,cp932
  endif
endif

" vim:tw=78:sw=2:norl:

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" runtimepath
set runtimepath+=$HOME/.vim
"" "" pathogen
"" " .vim/bundle/plugin_nameを読み込むようにする
"" call pathogen#runtime_append_all_bundles()
"" " .vim/bunle/plugin_nameのヘルプを読み込めるようにする
"" call pathogen#helptags()

"" NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))

filetype plugin on
filetype indent on
syntax on

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'surround.vim'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
""NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'mattn/calendar-vim'

NeoBundle 'kannokanno/previm'

NeoBundleCheck

let g:user_zen_settings = {
      \ 'lang' : 'ja',
      \ }
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
      \ 'type': 'markdown/pandoc',
      \ 'outputter': 'browser',
      \ 'cmdopt': '-s'
      \ }

let g:previm_open_cmd = 'chrome'

au BufRead,BufNewFile *.scss set filetype=scss
autocmd BufRead,BufNewFile *.mkd set filetype=markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

