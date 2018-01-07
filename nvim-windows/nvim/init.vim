set nocompatible
filetype off


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug configurations

"call plug#begin('%USERPROFILE%\AppData\Local\nvim')
"call plug#begin('%USERPROFILE%\AppData\Local\nvim\plugged')
"call plug#begin('c:\users\c86j224s\AppData\Local\nvim\plugged')
call plug#begin('~/.config/nvim')

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-fugitive'

"Plug 'valloric/youcompleteme'

Plug 'scrooloose/syntastic'

"Plug 'fatih/vim-go'

Plug 'brookhong/cscope.vim'

Plug 'racer-rust/vim-racer'

Plug 'autozimu/LanguageClient-neovim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerd tree configurations

nmap <F7> :NERDTreeToggle<CR>
"let NERDTreeIgnore=['\c^ntuser\..*']
let NERDTreeShowHidden=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic configurations

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configurations for cscope plugin

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

" cscope
"set csprg=/usr/bin/cscope 
"set csto=0 
"set cst 
"set nocsverb 
"if filereadable("./cscope.out") 
"    cs add cscope.out 
"else 
"    cs add /usr/src/linux/cscope.out 
"endif 
"set csverb

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configurations for racer

"let g:racer_cmd = "/path/to/racer/bin"

let g:racer_experimental_completer = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configurations for languageclient plugin.

autocmd BufReadPost *.rs setlocal filetype=rust

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" common configurations

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

" turnon syntax highlight by file ext
sy enable

" highlight cursorline
set cursorline

" hilight colorcolumn
"set cc=51,81,121
"hilight ColorColumn ctermbg=17 guibg=navyblue
let &colorcolumn=join(range(81,999),",")
hi ColorColumn guibg=#000020 ctermbg=17

colors desert
