set nocompatible
filetype on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Using Vundle:
" https://github.com/gmarik/Vundle.vim

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sickill/vim-monokai'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'adimit/prolog.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'derekwyatt/vim-scala'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'digitaltoad/vim-jade'

call vundle#end()
filetype plugin indent on

" For showing off .vimrc
autocmd! bufwritepost .vimrc source %

" Spell checking and text wrap for git commits
" autocmd Filetype gitcommit spell textwidth=72
au BufRead,BufNewFile *.txt,*.tex set wrap linebreak nolist textwidth=0 wrapmargin=0
autocmd FileType gitcommit setlocal spell
set complete+=kspell

" Spell checking and text wrap for markdown
au BufRead,BufNewFile *.md,*.markdown setlocal wrap spell linebreak nolist textwidth=80 wrapmargin=0


let NERDTreeDirArrows=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='wombat'
let g:airline_powerline_fonts=1
let g:vim_markdown_folding_disabled=1
set laststatus=2

syntax enable
colorscheme monokai
set encoding=utf-8

set spelllang=en
set cursorline         " Highlight current line
set number             " add line number for current line
set title              " Show filename in titlebar
set showcmd            " Show what command I'm typing
set scrolloff=3        " Show me where I'm going
set wildmenu           " Autocomplete commands
set tabstop=4          " Set the tabstop to 4 spaces
set shiftwidth=4       " Shiftwidth should match tabstop
set softtabstop=4      " backspace tabs
set expandtab          " Convert tabs to <tabstop> number of spaces
set backspace=2        " makes backspace work like you expect
set autoindent
set smartindent
set smarttab
set formatoptions+=ro  " Insert leading comment characters on newline
set showmatch          " Show matching [] () {} etc...
set ignorecase	       " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search
set noeb               " No error bells
set splitbelow
set splitright
set ttyfast
set lazyredraw
set clipboard=unnamed  " Copy/paste like normal
set autowrite          " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a            " Enable mouse usage (all modes)
set background=dark

if exists('+relativenumber')
	set relativenumber     " turns on relative line numbering
endif

if exists('+colorcolumn')
  set colorcolumn=81
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

if has('persistent_undo')
    if !isdirectory($HOME . "/.vim/undo")
        call mkdir($HOME . "/.vim/undo", "p")
    endif
	set undofile
	set undodir=./.undo,~/.vim/undo//,.
endif

if !isdirectory($HOME . "/.vim/backup")
    call mkdir($HOME . "/.vim/backup", "p")
endif
set backup
set backupdir=./.backup,~/.vim/backup//,. " put it here

if !isdirectory($HOME . "/.vim/swp")
    call mkdir($HOME . "/.vim/swp", "p")
endif
set directory=./.swp,~/.vim/swp//,.             " put swap files here

" behave yourself
nnoremap Y y$

" because of wordwrap
noremap j gj
noremap k gk

" moving around splits
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" moving between tabs
nmap <C-l> gt
nmap <C-h> gT

" move between tabs in insert mode
imap <silent> <C-l> <ESC>gt
imap <silent> <C-h> <ESC>gT

" easier than esc
imap <silent> <C-k> <ESC>

" :T <filename> opens file in new tab
command! -complete=file -nargs=1 T tabedit <args>

" Format file as JSON
command! Json %!python -m json.tool

" Tab completion!
function! SuperTab()
  if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
    return "\<Tab>"
  else
    return "\<C-n>"
  endif
endfunction
imap <Tab> <C-R>=SuperTab()<CR>

" Strip trailing whitespace (\ss) (strip spaces)
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

highlight WhitespaceEOL ctermbg=Red guibg=Red
match WhitespaceEOL /\s\+$/

" Make vim turn *off* expandtab for files named Makefile or makefile
" We need the tab literal
autocmd BufNewFile,BufRead [Mm]akefile* set noexpandtab
autocmd BufNewFile,BufRead *\.md set noexpandtab

" Nerdtree
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Fugitive
map <Leader>gb :Gblame<CR>
map <Leader>gs :Gstatus<CR>

" Keep selection highlighted when changing indentation
vnoremap < <gv
vnoremap > >gv

" More logical indent/decrement
nnoremap + <C-a>
nnoremap - <C-x>

let g:EclimCompletionMethod = 'omnifunc'


" au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['python', 'coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']
