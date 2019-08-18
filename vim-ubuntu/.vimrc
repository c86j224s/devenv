set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" set rtp+=%userprofile%/.vim/bundle/Vundle.vim/
" call vundle#begin('%userprofile%/.vim/bundle')

Bundle 'gmarik/vundle'


Plugin 'The-NERD-tree'
nmap <F7> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0


Plugin 'AutoComplPop'


Plugin 'taglist-plus'
nmap <F8> :TlistToggle<CR>
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1


" plugins for go
Plugin 'fatih/vim-go'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'

Plugin 'JamshedVesuna/vim-markdown-preview'

Plugin 'osyo-manga/vim-over'
" nnoremap <silent><leader>m :OverCommandLine<cr>%s/

Plugin 'klen/python-mode'

""""""""""""""""""""""""""""""""""""""""
" Plugins for cscope
Plugin 'brookhong/cscope.vim'

nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

""""""""""""""""""""""""""""""""""""""""
" plugins for rust language server
Plugin 'rust-lang/rust.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif



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

" cscope
set csprg=/usr/bin/cscope 
set csto=0 
set cst 
set nocsverb 
if filereadable("./cscope.out") 
    cs add cscope.out 
else 
    cs add /usr/src/linux/cscope.out 
endif 
set csverb

Plugin 'cocopon/iceberg.vim'

"se guifont=Courier\ 10\ Pitch\ 14
"se gfn=나눔고딕코딩\ 16
se gfn=SF\ Mono\ Medium\ 13
