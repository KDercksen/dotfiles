filetype off
execute pathogen#infect()
execute pathogen#helptags()

filetype on
filetype indent plugin on
syntax enable
hi Normal ctermbg=NONE
set background=dark
colorscheme solarized

autocmd! bufwritepost .vimrc source %

set laststatus=2
set statusline=
set statusline+=%t  " tail of filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
set statusline+=%{&ff}] " file format
set statusline+=%m " modified flag
set statusline+=%y " filetype
set statusline+=%{fugitive#statusline()}
set statusline+=%= " left right sep
set statusline+=%c, "cursor col
set statusline+=%l/%L " cursor line/total lines
set statusline+=\ %P " percent through file
set nocompatible
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

" Add ruby/html 2 space indent
autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2

let g:SuperTabDefaultCompletionType="context"
let g:syntastic_python_checkers = ['flake8']
let g:jedi#popup_on_dot = 0
set completeopt=menuone,longest,preview
let g:pep8_map = '<leader>8'
let g:ctrlp_match_window="bottom,order:btt,min:10,max:10"

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
