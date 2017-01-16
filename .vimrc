" =============== Plugins ======================
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" General
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tlib_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'

" JavaScript specific
Plugin 'groenewege/vim-less'
Plugin 'isRuslan/vim-es6'
Plugin 'mxw/vim-jsx'
Plugin 'flazz/vim-colorschemes'
Plugin 'pangloss/vim-javascript'
Plugin 'taxilian/vim-web-indent'

" HTML
Plugin 'rstacruz/sparkup'

call vundle#end()

filetype plugin indent on

" End Plugins

" Sparkup config for JSX
autocmd FileType javascript.jsx runtime! ftplugin/html/sparkup.vim

" =============== General Settings ======================
" Change our leader.
let mapleader = ','
let g:mapleader = ','

" Visual mode with jk - makes going to visual mode faster.
inoremap jk <esc>

"space to toggle folds
:nnoremap <space> za

"Fast saving
nmap <leader>w :w!<cr>

" Sudo save
command W w !sudo tee % > /dev/null

" Forget being compatible with good ol' vi
set nocompatible

" Enable filetype plugins 
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax on

" History size
set history=1000

" Auto reload file when changed
set autoread

" Line numbers
set nu

" Auto fold code
set foldenable

" Show partial commands in status line and
set showcmd

" Don't update the display while executing macros
set lazyredraw

" Speeding vim a little bit
set ttyfast
set ttyscroll=5

" Show current mode
set showmode

" Opening any new tab to the right
set splitright

" Set incremental searching"
set incsearch

" Highlight searching
set hlsearch

" Case insensitive search
set ignorecase
set smartcase

" show matching brackets/parenthesis
set showmatch
" MacVim disable error sounds
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif



" =============== Indentations ======================
"Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" =============== Tabs and Buffers ======================
" Courtesy of https://github.com/amix/vimrc
"Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Switch between buffers without saving
set hidden

" Disable highlight
map <silent> <leader>/ :noh<cr>

" Better way to move between windows
noremap <silent> <leader>h :wincmd h<CR>
noremap <silent> <leader>j :wincmd j<CR>
noremap <silent> <leader>k :wincmd k<CR>
noremap <silent> <leader>l :wincmd l<CR>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Next and Previous buffer
map <left> :bnext<cr>
map <right> :bprevious<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" =============== Statusline -Airline-  ======================
"Always show statusline
set laststatus=2

" Airline config
" Enable bufferline
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
" Enable fugative
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = 'No Git here.'
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline_theme='wombat'


" =============== Colors ======================
" Support 256 colors in gnome terminal.
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

color gruvbox
let g:gruvbox_contrast_dark='soft'
set bg=dark

" =============== Snips & Nerd tree ======================
" Toggle Nerdtree
map <leader>n :NERDTreeToggle<CR>
" Nerdtree Ignore list
let NERDTreeIgnore=['\.pyc$', '\.swp$', '\.swp$']

" Ultisnips config
let g:UltiSnipsSnippetsDir = "~/.vim/ultisnips"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" =============== Functions ======================
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
