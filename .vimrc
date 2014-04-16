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
set runtimepath^=~/.vim/bundle/ctrlp.vim

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

au BufNewFile,BufRead *.tex let @a=':w:!latex % && latex % && latex % && dvipdfm %:r.dvi && evince %:r.pdf'
au BufNewFile,BufRead *.cpp let @a=':w:!g++ % -o %:r -Wall && chmod +x %:r && ./%:r' 
let g:SuperTabDefaultCompletionType="context"
let g:jedi#popup_on_dot = 0
set completeopt=menuone,longest,preview
let g:pep8_map = '<leader>8'

" Change leader key to be ,
let mapleader=","
nnoremap <leader>v <Plug>TaskList

" Change Snipmate trigger to
imap <leader>[ <Plug>snipMateNextOrTrigger
smap <leader>[ <Plug>snipMateNextOrTrigger
imap <leader>{ <Plug>snipMateBack
smap <leader>{ <Plug>snipMateBack

" Remap Alt+J and Alt+K to move lines down/up in normal mode
nnoremap <A-k> ddkP
nnoremap <A-j> ddp

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
