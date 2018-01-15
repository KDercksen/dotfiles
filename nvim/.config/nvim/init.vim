call plug#begin()

Plug 'KDercksen/vim-snippets'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'fs111/pydoc.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'neomake/neomake'
Plug 'skywind3000/asyncrun.vim'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'zchee/deoplete-jedi'

call plug#end()
call neomake#configure#automake('w')

set background=dark
colorscheme solarized
" Fixes for SignColumn messages
hi NeomakeErrorSign ctermbg=0 ctermfg=9
hi NeomakeInfoSign ctermbg=0 ctermfg=6
hi NeomakeMessageSign ctermbg=0 ctermfg=4
hi NeomakeWarningSign ctermbg=0 ctermfg=5
hi SignColumn ctermbg=0

autocmd FileType html setlocal commentstring=<!--\ %s\ -->

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set autochdir
set cc=80
set clipboard=unnamed
set completeopt=menuone,longest,preview
set expandtab
set foldlevel=99
set foldmethod=indent
set history=50
set ignorecase
set list
set listchars=tab:▶\ ,trail:·,extends:»,precedes:«
set mouse=""
set noerrorbells
set noswapfile
set novisualbell
set number
set relativenumber
set shiftwidth=4
set softtabstop=4
set t_Co=256
set tabstop=4
set timeoutlen=1000 ttimeoutlen=0
set whichwrap+=<,>,h,l

let g:python_host_prog = '/home/koen/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/koen/.pyenv/versions/neovim3/bin/python'

let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'
let g:airline_powerline_fonts = 1

let g:SuperTabDefaultCompletionType = 'context'

let g:ultisnips_python_quoting_style = 'single'
let g:ultisnips_python_style = 'google'

let g:jedi#popup_on_dot = 0

let g:tex_flavor = 'latex'

let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1

let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:10'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1

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
