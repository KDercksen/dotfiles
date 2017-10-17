call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
Plug 'fs111/pydoc.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'neomake/neomake'
Plug 'altercation/vim-colors-solarized'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-commentary'

call plug#end()
call neomake#configure#automake('w')

set background=dark
colorscheme solarized
hi Normal ctermbg=NONE
hi SpecialKey ctermbg=NONE

autocmd FileType html setlocal commentstring=<!--\ %s\ -->

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set history=50
set number
set whichwrap+=<,>,h,l
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
set listchars=tab:▶\ ,trail:·,extends:»,precedes:«
set list

let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'
let g:airline_powerline_fonts = 1
let g:SuperTabDefaultCompletionType = 'context'
let g:jedi#popup_on_dot = 0
set completeopt=menuone,longest,preview
let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:10'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:solarized_termtrans = 1
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

" Change leader key to be ,
let mapleader=","

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

" Unmap arrow keys
for prefix in ['i', 'n', 'v']
    for key in ['<Up>', '<Down>', '<Left>', '<Right>']
        exe prefix . "noremap " . key . " <Nop>"
    endfor
endfor
