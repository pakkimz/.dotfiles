set termguicolors                                       " enable true colors support, disable it when use solarized
set nocompatible
set synmaxcol=128                                       " syntax coloring lines that are too long just slows down the world
set t_Co=256                                            " enable 256 color
set t_ut=                                               " disbale background color erase (BCE)
set re=1                                                " fixes slow speed due to syntax highlighting
set number
set noshowmode                                          " hide the insert status
set showcmd                                             " showing command history
set matchtime=3
set ttimeoutlen=10                                      " faster sequance esc+O
set ttyfast
set ttyscroll=3
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=106
set autoindent
set mouse=a
set ttymouse=xterm2                                     " resize split with mouse
set wildmenu
set nostartofline                                       " sometimes cursor jumping back
set expandtab
set hlsearch
set autowrite		                                        " automatically save before commands like :next and :make
set complete-=i                                         " get rid system include in auto completion
set undofile
set history=1000
set backup
set backupext=.bak
set viminfo='20,\"100,s10,h                             " dont store more than 100 lines, h: disable hlsearch, s10 max KB
set undodir^=~/.vim/tmp/undo//
set directory=~/.vim/tmp/swap//
set backupdir=~/.vim/tmp/backup//
set dictionary=/usr/share/dict/words
set listchars=tab:→\ ,eol:↲                             " unicode for → = u2192, ↲ = u21b2. set list display it

syntax on
syntax sync minlines=256

filetype plugin indent on                               " all in one line

call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'                             " mandatory
Plug 'Raimondi/delimitMate'                             " jump c-g g or just repeat the action
Plug 'yuttie/comfortable-motion.vim'
Plug 'henrik/vim-indexed-search'
Plug 'matze/vim-move'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'jeetsukumaran/vim-buffergator'                    " leader-b for for buffer leader-t for tab
Plug 'ivalkeen/vim-simpledb'
Plug 'ap/vim-css-color'
Plug 'valloric/matchtagalways'
Plug 'Yggdroot/indentLine'                              " need expandtab to make it works
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/loremipsum'
Plug 'majutsushi/tagbar'                                " sudo apt install exuberant-ctags
call plug#end()

let mapleader = "\<Space>"
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let g:tagbar_sort = 0                                   " order tags based on file order, don't sort alphabetically
let g:move_map_keys = 0                                 " disable other keys vim-move and just use my mapping below
let g:comfortable_motion_no_default_key_mappings = 1    " disable default mapping

colorscheme base16-synth-midnight-dark

nnoremap <silent><leader>0 :colorscheme base16-3024<CR>
nnoremap <silent><leader>1 :colorscheme base16-synth-midnight-dark<CR>
nnoremap <silent><leader>2 :colorscheme base16-irblack<CR>
nnoremap <silent><leader>3 :colorscheme base16-bright<CR>
nnoremap <silent><leader>4 :colorscheme base16-macintosh<CR>
nnoremap <silent><leader>5 :colorscheme base16-black-metal-bathory<CR>
nnoremap <silent><leader>6 :colorscheme base16-one-light<CR>
nnoremap <silent><leader>7 :colorscheme base16-summerfruit-light<CR>
nnoremap <silent><leader>8 :colorscheme base16-gruvbox-light-hard<CR>
nnoremap <silent><leader>9 :colorscheme base16-github<CR>

" go last edited
nnoremap ge `.

" say Nop for q and Q
noremap q <Nop>
noremap Q <Nop>

" supertab. for 'cancel complete C-e' / 'C-y for yes'
inoremap <tab> <C-p>
inoremap <S-tab> <tab>

" super duper tab
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-x><c-p>"))
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-x><c-n>"))

" intuitive moving buffer
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>

" add one space
nnoremap [s i<space><esc>
nnoremap ]s a<space><esc>

" re-select visual block after indenting
vnoremap < <gv
vnoremap > >gv

" move the beginning and end of line
noremap B ^
noremap E g_

" paste multiple lines multiple times with simple ppppp
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" moving around in command mode, ctrl+b & ctrl+e move beginning and end
cnoremap <C-l> <right>
cnoremap <C-h> <left>
cnoremap <C-k> <S-Right>
cnoremap <C-j> <S-Left>

" esc stuffs
inoremap <C-space> <Esc>`^
vnoremap <C-space> <Esc>gV
onoremap <C-space> <Esc>
cnoremap <C-space> <C-c>
nnoremap <C-space> <Esc>:noh<CR>

" vim-move mapping
vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp
nmap <C-j> <Plug>MoveLineDown
nmap <C-k> <Plug>MoveLineUp

" play with leader
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>W :wa!<CR>
nnoremap <silent><leader>x :x<CR>
nnoremap <silent><leader>q :q<CR>
nnoremap <silent><leader>Q :q!<CR>
nnoremap <silent><leader>r :bd<CR>
nnoremap <silent><leader>R :bw!<CR>
nnoremap <silent><leader>f :e .<CR>
nnoremap <silent><leader>F :e ~/<CR>
nnoremap <leader>e :e<Space>
nnoremap <leader>E :e <C-R>=expand("%:p:h") . "/" <CR>

" clipboard install vim-gtk
nnoremap gy "+y
nnoremap gY "+Y
vnoremap gy "+y
nnoremap gd "+d
nnoremap gD "+D
vnoremap gd "+d
nnoremap gp "+p
vnoremap gp "+p

" don't scroll too fast
nnoremap <silent> <C-d> :call comfortable_motion#flick(50)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-50)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(-100)<CR>

" tagbar
nnoremap <F8> :TagbarToggle<CR>

" move between tags
runtime! macros/matchit.vim
" plugin vim-repeat adding support to related plugins
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
" resize splits when the window is resized
autocmd VimResized * :wincmd =
" save when losing focus
autocmd FocusLost * :silent! wall
" remove set hidden to properly remove netrw with bd command
autocmd FileType netrw setl bufhidden=wipe
" remove any trailing whitespace that is in the file
autocmd BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" auto remove multiple empty lines at the end of line
autocmd BufWrite * :%s/\(\s*\n\)\+\%$//ge
" replace groups or function of empty or whitespaces-only lines with one empty line
autocmd BufWrite * :%s/\(\s*\n\)\{3,}/\r\r/ge
" disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" when switching buffers, preserve window view.
autocmd BufLeave * if !&diff | let b:winview = winsaveview() | endif
autocmd BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) | unlet! b:winview | endif
" resets the soft tab value to 2 spaces when I open a Python file
autocmd FileType python set shiftwidth=2
