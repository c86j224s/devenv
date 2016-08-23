set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" set rtp+=%userprofile%/.vim/bundle/Vundle.vim/
" call vundle#begin('%userprofile%/.vim/bundle')

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


" plugins for go
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'


Plugin 'JamshedVesuna/vim-markdown-preview'



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
set cindent

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
