set nocompatible
filetype on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Using Vundle:
" https://github.com/gmarik/Vundle.vim

Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sickill/vim-monokai'
Plugin 'rakr/vim-one'
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
Plugin 'ryanoasis/vim-devicons'
Plugin 'edkolev/tmuxline.vim' " Use this to modify my tmux airline theme.
Plugin 'rstacruz/sparkup'
Plugin 'mhinz/vim-startify'
Plugin 'groenewege/vim-less'
Plugin 'kien/ctrlp.vim'
Plugin 'ap/vim-css-color'
Plugin 'valloric/youcompleteme'
Plugin 'yggdroot/indentline' " I favor this over Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'easymotion/vim-easymotion'
Plugin 'elzr/vim-json'
Plugin 'marcweber/vim-addon-local-vimrc'
Plugin 'othree/javascript-libraries-syntax.vim'
" Plugin 'pangloss/vim-javascript'
Plugin 'isruslan/vim-es6'
Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'laurilehmijoki/haskellmode-vim'

call vundle#end()

filetype plugin indent on

" set encoding=utf-8


" Enable local .vimrc.
let g:local_vimrc = {'names':['.vimrc'],'hash_fun':'LVRHashOfFile'}

" Enable rainbow parentheses. Doesn't seem to work with vim-javascript.
" let g:rbpt_colorpairs = [
"     \ ['brown',       'RoyalBlue3'],
"     \ ['Darkblue',    'SeaGreen3'],
"     \ ['darkgray',    'DarkOrchid3'],
"     \ ['darkgreen',   'firebrick3'],
"     \ ['darkcyan',    'RoyalBlue3'],
"     \ ['darkred',     'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['brown',       'firebrick3'],
"     \ ['gray',        'RoyalBlue3'],
"     \ ['black',       'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['Darkblue',    'firebrick3'],
"     \ ['darkgreen',   'RoyalBlue3'],
"     \ ['darkcyan',    'SeaGreen3'],
"     \ ['darkred',     'DarkOrchid3'],
"     \ ['red',         'firebrick3'],
"     \ ]
" let g:rbpt_max = 16
" let g:rbpt_loadcmd_toggle = 1
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

" Set g:python3_host_prog to point Nvim to a specific Python 3 interpreter:
let g:python3_host_prog = '/usr/bin/python3'
" g:loaded_python3_provider

" For showing off .vimrc
autocmd! bufwritepost .vimrc source %

" For vim-less
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

" Spell checking and text wrap for git commits
" autocmd Filetype gitcommit spell textwidth=72
au BufRead,BufNewFile *.txt,*.tex set wrap linebreak nolist textwidth=0 wrapmargin=0
autocmd FileType gitcommit setlocal spell
set complete+=kspell


" Spell checking and text wrap for markdown
au BufRead,BufNewFile *.md,*.markdown setlocal wrap spell linebreak nolist textwidth=80 wrapmargin=0

" Markdown - Don't conceal syntax.
let g:vim_markdown_conceal = 0

" Make esc occur faster.
set timeoutlen=1000 ttimeoutlen=0

" Use JSON Plugin.
au! BufRead,BufNewFile *.json set filetype=json
let g:vim_json_syntax_conceal = 0

" Don't ever conceal syntax... WTF?
set conceallevel=0

" Spell checking and text wrap for LaTeX
au BufRead,BufNewFile *.tex setlocal wrap spell linebreak nolist textwidth=80 wrapmargin=0

" Underline content that matches a search.
set hlsearch


let NERDTreeDirArrows=1
let g:Powerline_symbols='fancy'
let g:vim_markdown_folding_disabled=1
let g:webdevicons_conceal_nerdtree_brackets=1
let g:WebDevIconsNerdTreeAfterGlyphPadding=' '
let g:DevIconsEnableFolderExtensionPatternMatching = 1
set laststatus=2

" Tab settings for javascript files.
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab

" Recommended Syntastic settings.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Feross's standard for JS.
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_javascript_standard_exec = 'semistandard'

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

autocmd VimEnter * call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('zshrc', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('py', 'yellow', 'none', 'yellow', '#151515')

" NERDTress File highlighting only the glyph/icon
autocmd filetype nerdtree syntax match haskell_icon "" containedin=NERDTreeFile
" if you are using another syn highlight for a given line (e.g.
" NERDTreeHighlightFile) need to give that name in the 'containedin' for this
" other highlight to work with it
autocmd filetype nerdtree syntax match html_icon ## containedin=NERDTreeFile,html
autocmd filetype nerdtree syntax match go_icon ## containedin=NERDTreeFile

" test highlight just the glyph (icons) in nerdtree:
autocmd filetype nerdtree highlight haskell_icon ctermbg=none ctermfg=Red guifg=#ffa500
autocmd filetype nerdtree highlight html_icon ctermbg=none ctermfg=Red guifg=#ffa500
autocmd filetype nerdtree highlight go_icon ctermbg=none ctermfg=Red guifg=#ffa500

" Fix enter in normal mode.
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Make enter do things in normal mode.
" nnoremap <CR> o<Esc>

" Smash f and j together to escape. (Bad because sometimes I like to smash
" homerow keys while I'm thinking. =P
" inoremap jf <Esc>
" inoremap fj <Esc>

" Tmuxline settings
let g:airline#extensions#tmuxline#enabled = 0
" let g:tmuxline_preset = 'zenburn'

" Enable the list of buffers.
let g:airline#extensions#tabline#enabled = 1

" Auto populate g:airline_symbols with powerline symbols.
let g:airline_powerline_fonts=1

" Show just the filename.
" let g:airline#extensions#tabline#fnamemod = ':t'

if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

syntax enable
set t_Co=256
set background=dark " for the dark version
" set background=light " for the light version
" colorscheme monokai
colorscheme one
let g:one_allow_italics = 1 " I love italic for comments
let g:airline_theme='one'

" Change popup menu colors.
" highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#0000ff

set spelllang=en
set number             " add line number for current line
set title              " Show filename in titlebar
set showcmd            " Show what command I'm typing
set scrolloff=3        " Show me where I'm going
set wildmenu           " Autocomplete commands
set tabstop=4          " Set the tabstop to 4 spaces
set shiftwidth=4       " Shiftwidth should match tabstop
set softtabstop=4      " backspace tabs
set expandtab          " Convert tabs to <tabstop> number of spaces
set backspace=indent,eol,start        " makes backspace work like you expect
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
set clipboard=unnamedplus  " Copy/paste like normal
set autowrite          " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a            " Enable mouse usage (all modes)

" Enable relative numbering because it's great!
if exists('+relativenumber')
    set relativenumber     " turns on relative line numbering
endif

" Highlight current line
if exists('+cursorline')
    set cursorline
    hi CursorLine ctermbg=red guibg=#32363E
endif

" Highlight the 81st column so we know not to let our code extend past it.
if exists('+colorcolumn')
    set colorcolumn=81
    hi ColorColumn ctermbg=red guibg=#32363E
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
" nmap <C-l> gt
" nmap <C-h> gT

" move between tabs in insert mode
" imap <silent> <C-l> <ESC>gt
" imap <silent> <C-h> <ESC>gT

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

" Strip trailing whitespace (\ss) (strip spaces).
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Highlight trailing whitespace.
highlight WhitespaceEOL ctermbg=Red guibg=Red
match WhitespaceEOL /\s\+$/

" Make vim turn *off* expandtab for files named Makefile or makefile
" We need the tab literal
autocmd BufNewFile,BufRead [Mm]akefile* set noexpandtab
autocmd BufNewFile,BufRead *\.md set noexpandtab

" Nerdtree
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Tagbar
map <Leader>t :TagbarToggle<CR>

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

if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif

" LaTeX Suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
