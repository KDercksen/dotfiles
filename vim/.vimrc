set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

Bundle 'gmarik/vundle'
Bundle 'davidhalter/jedi-vim'
Bundle 'nvie/vim-flake8'
Bundle 'fs111/pydoc.vim'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'garbas/vim-snipmate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'Shougo/neocomplete.vim'

filetype on
filetype indent plugin on
syntax enable
set background=dark
colorscheme solarized
hi Normal ctermbg=NONE
hi SpecialKey ctermbg=NONE

autocmd! bufwritepost .vimrc source %
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set laststatus=2
set history=50
set number
set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set incsearch
set noerrorbells
set novisualbell
set foldmethod=indent
set foldlevel=99
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autochdir
set clipboard=unnamed
set cc=80
set mouse=""
set noswapfile
set t_Co=256
set tags=./tags;,tags;
set listchars=tab:▶\ ,trail:·,extends:»,precedes:«
set list

let g:SuperTabDefaultCompletionType = 'context'
let g:syntastic_python_checkers = ['pyflakes', 'pycodestyle']
let g:jedi#popup_on_dot = 0
set completeopt=menuone,longest,preview
let g:ctrlp_match_window="bottom,order:btt,min:10,max:10"
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:solarized_termtrans=1
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" Haskell-vim stuff
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Change leader key to be ,
let mapleader=","
nnoremap <leader>v <Plug>TaskList

" Change Snipmate trigger to
imap <leader>[ <Plug>snipMateNextOrTrigger
smap <leader>[ <Plug>snipMateNextOrTrigger
imap <leader>{ <Plug>snipMateBack
smap <leader>{ <Plug>snipMateBack

" Map Ctrl+movement keys to move around windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" map sort function to leader+s
vnoremap <leader>s :sort<CR>

" make moving blocks of code easy
vnoremap < <gv
vnoremap > >gv

" map NERDTree to <leader>n
map <leader>n :NERDTreeToggle<CR>

" Unmap arrow keys
for prefix in ['i', 'n', 'v']
    for key in ['<Up>', '<Down>', '<Left>', '<Right>']
        exe prefix . "noremap " . key . " <Nop>"
    endfor
endfor

" Make sure the gui font is set to Lucida Console
if has ('gui_running')
    set guifont=Lucida_Console:h10
endif

" Virtualenv fix
" py3 << EOF
" import os.path
" import sys
" import vim
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     sys.path.insert(0, project_base_dir)
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     exec(open(activate_this).read(), dict(__file__=activate_this))
" EOF
