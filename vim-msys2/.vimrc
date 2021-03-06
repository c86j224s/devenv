set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'


Plugin 'The-NERD-tree'
nmap <F7> :NERDTreeToggle<CR>


Plugin 'AutoComplPop'


Plugin 'taglist-plus'
nmap <F8> :TlistToggle<CR>
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1

Plugin 'valloric/YouCompleteMe'

" plugins for colors
Plugin 'altercation/vim-colors-solarized'

" plugins for go
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'

Plugin 'JamshedVesuna/vim-markdown-preview'

Plugin 'osyo-manga/vim-over'
" nnoremap <silent><leader>m :OverCommandLine<cr>%s/


" plugins for rust
Plugin 'rust-lang/rust.vim'

Plugin 'racer-rust/vim-racer'
set hidden
let g:racer_cmd="/C/Users/c86j224s/.cargo/bin/racer.exe"
let $RUST_SRC_PATH="~/github/rust/src"
let g:racer_experimental_completer = 1

Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1


filetype plugin indent on


scripte utf-8

" vim functions
set nocp

" recover options
" set all&

" commands history
set hi=100

" use backspace
set bs=indent,eol,start

" set encoding
"set enc=utf-8,cp949
set fenc=utf-8
" set fenc=utf-8,cp949,cp932,euc-jp,shift-jis,big5,ucs-2le,latin1

" show always cursor position
set ru

" show command completing
set sc

" number line
set nu

" line width
set nuw=5

" indentation
set smartindent
set autoindent

" magic feature
set magic

" visual mode
set sel=exclusive

" matching parenthesis
set mps+=<:>
set sm

" highlight searchcase
set hlsearch

" ignore case in search
set ignorecase

" smart case check
" set ic

" tabs
set tabstop=4
set shiftwidth=4
set expandtab

" show always status line
set ls=2

" turnon syntax highlight by file ext
sy enable

" highlight cursorline
if has('gui_running')
    set cursorline
endif

" set themes
"se gfn=Cousine:b:h10
se gfn=Menlo:h10
if has('gui_running')
    set background=light
    colors solarized
endif
