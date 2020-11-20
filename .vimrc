let mapleader = ","
set nocompatible            " be iMproved, required
set relativenumber          " show relative number top to bottom
set title                   " show title top of terminal
set clipboard=unnamedplus
set encoding=utf-8
filetype off                " required
helptags ~/.vim/doc
filetype plugin on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'


Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'SirVer/ultisnips'
"dart language support
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'natebosch/vim-lsc'
Plugin 'natebosch/vim-lsc-dart'



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
let g:gruvbox_contrast_dark  = 'hard'


" tender
" termschool
" solarized8
" abstract
" deus
"


"Highlight color for search
"F3
set hlsearch                    
hi Search ctermbg = LightYellow
hi Search ctermfg = Red



" vim-dart-plugin
let g:dart_style_guide = 4



"set up for ultisnips
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file"



 
"setup for delimitmate
let delimitMate_expand_space = 1
let delimitMateBackspace = 1
autocmd filetype htmldjango let b:delimitMate_matchpairs = "(:),[:],<:>"





"set up for ycm
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''


let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info


let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1


let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'

"let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
"let g:ycm_python_binary_path = 'python'
"let g:ycm_complete_in_comments = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
""let g:ycm_filetype_blacklist = {'html' : 1}
"let g:ycm_semantic_triggers =  {
"  \ 'c' : ['re!\w{2}'],
"  \ 'cpp' : ['re!\w{2}'],
"  \ 'python' : ['re!\w{2}'],
"\ }




"set up NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif




"set up syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] } 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_cpp_checkers = ['cppcheck' , 'cppclean']
nnoremap <leader>E :SyntasticCheck<CR>




"vim keybinding
"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>j :+10<cr>
nnoremap <leader>k :-10<cr>
nnoremap <leader>pf :SyntasticCheck flake8<cr>
nnoremap <leader>pp :SyntasticCheck pylint<cr>
nnoremap <leader>cc :SyntasticCheck cppcheck<cr>
autocmd filetype python nnoremap <F9> :w <bar>!python %<cr>
autocmd filetype python nnoremap <F5> :w <bar>make py<cr>
autocmd filetype html nnoremap <leader>m :setfiletype htmldjango<cr>
autocmd FileType cpp nnoremap <F9> :w !clear <bar>make<cr>
autocmd FileType cpp nnoremap <F5> :!./%:r<cr>
autocmd FileType c nnoremap <F5> :!./%:r<cr>
autocmd filetype dart nnoremap <F9> :w <bar>!dart %<cr>
nnoremap <F6> :silent !clear <Enter>
nnoremap <F3> :noh<CR>
nnoremap <C-l> :tabnext<CR>
noremap <C-h> :tabprevious<CR>
