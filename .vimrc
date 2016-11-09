set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'groenewege/vim-less'
Plugin 'nvie/vim-flake8'
Plugin 'isRuslan/vim-es6'
Plugin 'mxw/vim-jsx'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}           
Plugin 'flazz/vim-colorschemes'
Plugin 'pangloss/vim-javascript'
Plugin 'octol/vim-cpp-enhanced-highlight'


call vundle#end() 

filetype plugin indent on

"--------------------------------------------
"GENERAL & NAVIGATION------------------------
"--------------------------------------------
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Forget being compatible with good ol' vi
set nocompatible

" Share clipboard with system
" set clipboard=unnamed

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax on

" Store a ton of history (default is 20)
set history=1000

" Auto reload file when changed
set autoread

" set a vertical colomn at char 80
set colorcolumn=120

" ignore pyc files
set wildignore+=*.pyc

" Use arrow keys to change buffers
noremap <left> :bp<CR>
noremap <right> :bn<CR>

"line numbers
set nu

" Switch between buffers without saving
set hidden

" show the ruler
"set ruler

" auto fold code
set foldenable

" a ruler on steroids
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) 
"status line
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" show partial commands in status line and
set showcmd

" Don't update the display while executing macros
set lazyredraw

"to speed vim alittle
set ttyfast
set ttyscroll=5

" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion. Presumes you have compiled
"with +wildmenu.  See :help 'wildmenu'
"set wildmenu

" wrap long lines
set nowrap

"opening any new tab to the right
set splitright

"--------------------------------------------
"SEARCHING-----------------------------------
"--------------------------------------------
"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase



"indentation
set expandtab
set shiftwidth=4
set softtabstop=4

set foldmethod=indent
set foldlevel=99
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" backspace for dummys
set backspace=indent,eol,start

" show matching brackets/parenthesis
set showmatch

set laststatus=2
" Broken down into easily includeable segments
set statusline=%<%f\    " Filename
set statusline+=%w%h%m%r " Options
set statusline+=\ [%{&ff}/%Y]            " filetype
set statusline+=\ [%{getcwd()}]          " current dir
"set satusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <f2> :if &guioptions =~# 'T' <bar>
\set guioptions-=T <Bar>
\set guioptions-=m <bar>
\else <Bar>
\set guioptions+=T <Bar>
\set guioptions+=m <bar>
\endif <CR>

color gruvbox
"colorscheme firewatch
let g:gruvbox_contrast_dark='soft' 
set bg=dark

"css syntax highlight for LESS file
au BufNewFile,BufRead *.less set filetype=css

"--------------------------------------------
"CONCEALING----------------------------------
"--------------------------------------------
"will only show true character in insert mode.
setlocal concealcursor=cnv 
setlocal conceallevel=2

" example conceal: syntax match scalaArrow "⇒" conceal cchar=→     

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mappings mappings mappings mappings mappings mappings mappings map "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ','
noremap <silent> <C-S> :update<CR>

nmap <silent> <leader>/ :nohlsearch<CR>

" Let's make it easy to edit this file (mnemonic for the key sequence is 'e'dit 'v'imrc)
nmap <silent> <leader>ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is 's'ource 'v'imrc)
nmap <silent> <leader>sv :so $MYVIMRC<cr>

inoremap jk <esc>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

" Maps to make handling windows a bit easier
noremap <silent> <leader>h :wincmd h<CR>
noremap <silent> <leader>j :wincmd j<CR>
noremap <silent> <leader>k :wincmd k<CR>
noremap <silent> <leader>l :wincmd l<CR>
noremap <silent> <leader>sb :wincmd p<CR>
noremap <silent> <leader>cj :wincmd j<CR>:close<CR>
noremap <silent> <leader>ck :wincmd k<CR>:close<CR>
noremap <silent> <leader>ch :wincmd h<CR>:close<CR>
noremap <silent> <leader>cl :wincmd l<CR>:close<CR>
noremap <silent> <leader>cc :close<CR>
noremap <silent> <leader>cw :cclose<CR>
noremap <silent> <leader>ml <C-W>L
noremap <silent> <leader>mk <C-W>K
noremap <silent> <leader>mh <C-W>H
noremap <silent> <leader>mj <C-W>J
noremap <silent> <leader>o <C-W>o

"space to toggle folds
:nnoremap <space> za


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mappings mappings mappings mappings mappings mappings mappings map "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""super tab"
"au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabNoCompleteAfter=[',', '\s', ';', '/', '^']

"""nerd tree"
map <leader>n :NERDTreeToggle<CR>
"array to ignore
let NERDTreeIgnore=['\.pyc$', '\.swp$', '\.swp$']
"""ultisnips"
let g:UltiSnipsSnippetsDir = "~/.vim/ultisnips"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsUsePythonVersion = 2

"LESS support"
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

" Flake8 for python linting
autocmd BufWritePost *.py call Flake8()

" HTML auto completion
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

let g:jsx_ext_required = 0


"window resizing
"---------------
" Shift-like window resizing
function! IsEdgeWindowSelected(direction)
    let l:curwindow = winnr()
    exec "wincmd ".a:direction
    let l:result = l:curwindow == winnr()

    if (!l:result)
        " Go back to the previous window
        exec l:curwindow."wincmd w"
    endif

    return l:result
endfunction

function! GetAction(direction)
    let l:keys = ['h', 'j', 'k', 'l']
    let l:actions = ['vertical resize -', 'resize +', 'resize -', 'vertical resize +']
    return get(l:actions, index(l:keys, a:direction))
endfunction

function! GetOpposite(direction)
    let l:keys = ['h', 'j', 'k', 'l']
    let l:opposites = ['l', 'k', 'j', 'h']
    return get(l:opposites, index(l:keys, a:direction))
endfunction

function! ShiftResize(direction, amount)
    " v >
    if (a:direction == 'j' || a:direction == 'l')
        if IsEdgeWindowSelected(a:direction)
            let l:opposite = GetOpposite(a:direction)
            let l:curwindow = winnr()
            exec 'wincmd '.l:opposite
            let l:action = GetAction(a:direction)
            exec l:action.a:amount
            exec l:curwindow.'wincmd w'
            return
        endif
    " < ^
    elseif (a:direction == 'h' || a:direction == 'k')
        let l:opposite = GetOpposite(a:direction)
        if IsEdgeWindowSelected(l:opposite)
            let l:curwindow = winnr()
            exec 'wincmd '.a:direction
            let l:action = GetAction(a:direction)
            exec l:action.a:amount
            exec l:curwindow.'wincmd w'
            return
        endif
    endif

    let l:action = GetAction(a:direction)
    exec l:action.a:amount
endfunction

" Map to Ctrl+hjkl to resize panes
nnoremap <S-h> :call ShiftResize('h', 1)<CR>
nnoremap <S-j> :call ShiftResize('j', 1)<CR>
nnoremap <S-k> :call ShiftResize('k', 1)<CR>
nnoremap <S-l> :call ShiftResize('l', 1)<CR>
