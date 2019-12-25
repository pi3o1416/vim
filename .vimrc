set nocompatible              " be iMproved, required
set title
filetype off                  " required
helptags ~/.vim/doc
filetype plugin on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'


Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'SirVer/ultisnips'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'

" Optional:
Plugin 'honza/vim-snippets'



call vundle#end()            " required
filetype plugin indent on    " required


" custom setting
set mouse=a
set number
set encoding=utf-8
set backspace=indent,eol,start
set cursorline
set guioptions=
syntax on


" indent for global
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent



" indent for special file


autocmd FileType c,cpp setlocal expandtab shiftwidth=4 softtabstop=4 cindent 
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 autoindent


"set up for solarized
"set background=light
"colorscheme flattened_dark


" setup for gruvbox
"set t_Co=256
set background=light
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'light'


" tender
" termschool
" solarized8
" abstract
" deus

"set up for ultisnips
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file"





"set up for ycm
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_python_binary_path = 'python'
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filetype_blacklist = {'html' : 1}
let g:ycm_semantic_triggers =  {
  \ 'c' : ['re!\w{2}'],
  \ 'cpp' : ['re!\w{2}'],
  \ 'python' : ['re!\w{2}'],
\ }




"set up NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


"set up indentline
"let g:indentLine_conceallevel = 4 




"set up tagbar
noremap <F8> :TagbarToggle<CR>




"set up syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint , flake8']
let g:syntastic_cpp_checkers = ['cppcheck' , 'cppclean']






"vim keybinding
"
let mapleader = "\<space>"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>j :+10<cr>
nnoremap <leader>k :-10<cr>
autocmd filetype python nnoremap <F9> :w <bar>!python %<cr>
autocmd filetype python nnoremap <F5> :w <bar>make py<cr>
autocmd FileType cpp nnoremap <F9> :w !clear <bar>make<cr>
autocmd FileType cpp nnoremap <F5> :!./%:r<cr>
autocmd FileType c nnoremap <F5> :!./%:r<cr>
nnoremap <F6> :silent !clear <Enter>
nnoremap <leader>pf :SyntasticCheck flake8<cr>
nnoremap <leader>pp :SyntasticCheck pylint<cr>
nnoremap <leader>cc :SyntasticCheck cppcheck<cr>
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O
inoremap CC <Esc>C
inoremap SS <Esc>S
inoremap DD <Esc>dd
inoremap UU <Esc>u
