set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" a tree explorer for vim
Plug 'scrooloose/nerdtree'

Plug 'brookhong/cscope.vim'

" a git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" A Vim plugin which shows a git diff in the sign column.
Plug 'airblade/vim-gitgutter'

call plug#end()

" use true color
set termguicolors

" set font
set guifont=JetBrains\ Mono:h13

" map nerdtree as f7 key
nmap <F7> :NERDTree<CR>

" for cscope ++++++++++++++++++++ begin
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
" for cscope -------------------- end

" for cscope extended ----------- begin
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
" for cscope extended ----------- end


filetype plugin indent on

se enc=utf-8

scripte utf-8

" use backspace
set bs=indent,eol,start

" show command completing
set sc

" show njumber line
set nu

" indentation
set smartindent
set autoindent

" magic feature
set magic

" visual mode
set sel=exclusive

" matching parenthesis
set mps+=<:>
set smartindent

" highlight searchcase
set hlsearch

" ignore case in search
set ignorecase

" tabs
set tabstop=4
set shiftwidth=4
set expandtab

" turn on syntax highlight by file ext
sy enable

" auto reload file
se autoread

" highlight cursor line
set cursorline

" hilight colorcolumn
"set cc=51,81,121
"hilight ColorColumn ctermbg=17 guibg=navyblue
let &colorcolumn=join(range(81,999),",")
hi ColorColumn guibg=#000020 ctermbg=17

" show file name in title
set title
