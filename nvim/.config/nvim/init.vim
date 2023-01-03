call plug#begin()

Plug 'psf/black' , { 'branch': 'stable' }
Plug 'KDercksen/vim-snippets'
Plug 'davidhalter/jedi-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'SirVer/ultisnips'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-clang'
Plug 'editorconfig/editorconfig-vim'
Plug 'fs111/pydoc.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'neomake/neomake'
Plug 'rhysd/vim-clang-format'
Plug 'scrooloose/nerdtree'
Plug 'skywind3000/asyncrun.vim'
Plug 'TovarishFin/vim-solidity'
Plug 'prettier/vim-prettier', {'do': 'yarn install && yarn add prettier-plugin-solidity',
                            \  'for': ['javascript', 'typescript', 'css', 'html', 'solidity']}
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vyperlang/vim-vyper'

call plug#end()
call neomake#configure#automake('w')

colorscheme tokyonight
set background=dark
" Fixes for SignColumn messages
hi NeomakeErrorSign ctermbg=NONE ctermfg=9
hi NeomakeInfoSign ctermbg=NONE ctermfg=6
hi NeomakeMessageSign ctermbg=NONE ctermfg=4
hi NeomakeWarningSign ctermbg=NONE ctermfg=5
hi SignColumn ctermbg=NONE
hi NonText ctermbg=NONE ctermfg=7
hi! Normal ctermbg=NONE
hi LineNr ctermbg=NONE

autocmd FileType html setlocal commentstring=<!--\ %s\ -->
autocmd BufWritePre *.py execute ":Black"
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.html,*.sol execute ":Prettier"
autocmd BufWinEnter '__doc__' setlocal bufhidden=delete

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set autochdir
set cc=80
set clipboard=unnamed
set completeopt=menuone,longest,preview
set encoding=utf-8
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
set wildignore+=*/data/*,*/tmp/*,*.so,*.swap,*.zip,*.tar.gz,*/node_modules/*,*/.git/*
set whichwrap+=<,>,h,l

let g:prettier#exec_cmd_path = '/home/koen/.config/nvim/plugged/vim-prettier/node_modules/.bin/prettier'
let g:prettier#autoformat = 1

let g:black_virtualenv = '/home/koen/.pyenv/versions/neovim3'
let g:python3_host_prog = '/home/koen/.pyenv/versions/neovim3/bin/python'

let g:neomake_python_enabled_makers = ['flake8', 'mypy']

let g:jedi#completions_enabled = 0

let g:airline_powerline_fonts = 1

let g:ultisnips_python_quoting_style = 'single'
let g:ultisnips_python_style = 'google'

let g:deoplete#popup_on_dot = 0
let g:deoplete#enable_at_startup = 1
call g:deoplete#custom#option("max_list", 10)

let g:deoplete#sources#rust#racer_binary = '/home/koen/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '/home/koen/rust/src'
let g:deoplete#sources#rust#show_duplicates = 0

let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-7/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-7/lib/clang'

let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'

let g:tex_flavor = 'latex'

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

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Change leader key to be ,
let mapleader=","

" Map Ctrl+movement keys to move around windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" map sort function to leader+s
vnoremap <leader>s :sort<CR>
map <leader>s :w<CR>:!isort %<CR><CR>

" make moving blocks of code easy
vnoremap < <gv
vnoremap > >gv

" Unmap arrow keys
for prefix in ['i', 'n', 'v']
    for key in ['<Up>', '<Down>', '<Left>', '<Right>']
        exe prefix . "noremap " . key . " <Nop>"
    endfor
endfor
