set nocompatible
filetype off

" change <Leader> key to Enter key.
let mapleader = "\<CR>"


" plugin load ------------------------------------------------------------ begin

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'rcarriga/nvim-notify'

" a tree explorer for vim
Plug 'scrooloose/nerdtree'

"Plug 'brookhong/cscope.vim' -- OBSOLETED. no support after neovim v0.9

" a git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" A Vim plugin which shows a git diff in the sign column.
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'majutsushi/tagbar'

call plug#end()

" plugin load -------------------------------------------------------------- end

" use true color
set termguicolors

" set font
"set guifont=Cascadia\ Code:h12
"set guifont=Cascadia\ Code:h14
"set guifont=Cascadia\ Code\ SemiLight:h13
"set guifont=Cascadia\ Code\ SemiLight:h13
"set guifont=RobotoMono\ Nerd\ Font\ Mono:b:h11
set guifont=JetBrains\ Mono:h12
"set guifont=JetBrains\ Mono:h14
"set guifont=Rec\ Mono\ Casual:h12
"set guifont=Rec\ Mono\ Linear:h12
"set guifont=Rec\ Mono\ Linear:h14
"set guifont=DejaVuSansM\ Nerd\ Font\ Mono:h14
"set guifont=Hurmit\ Nerd\ Font\ Mono:b:h16
"set guifont=Anonymous\ Pro:h14
"set linespace=4

" for nvim-notify -------------------------------------------------------- begin
lua require("notify").setup({ background_colour = "#000000", render = "default", stages = "fade_in_slide_out", })
lua vim.notify = require("notify")

highlight NotifyERRORBorder guifg=#8A1F1F
highlight NotifyWARNBorder guifg=#79491D
highlight NotifyINFOBorder guifg=#4F6752
highlight NotifyDEBUGBorder guifg=#8B8B8B
highlight NotifyTRACEBorder guifg=#4F3552
highlight NotifyERRORIcon guifg=#F70067
highlight NotifyWARNIcon guifg=#F79000
highlight NotifyINFOIcon guifg=#A9FF68
highlight NotifyDEBUGIcon guifg=#8B8B8B
highlight NotifyTRACEIcon guifg=#D484FF
highlight NotifyERRORTitle  guifg=#F70067
highlight NotifyWARNTitle guifg=#F79000
highlight NotifyINFOTitle guifg=#A9FF68
highlight NotifyDEBUGTitle  guifg=#8B8B8B
highlight NotifyTRACETitle  guifg=#D484FF
highlight link NotifyERRORBody Normal
highlight link NotifyWARNBody Normal
highlight link NotifyINFOBody Normal
highlight link NotifyDEBUGBody Normal
highlight link NotifyTRACEBody Normal
" for nvim-notify ---------------------------------------------------------- end

" for nerd tree ---------------------------------------------------------- begin
" map nerdtree as f7 key
nmap <F7> :NERDTree<CR>
" for nerd tree ------------------------------------------------------------ end

" for tagbar ------------------------------------------------------------- begin
nmap <F8> :TagbarToggle<CR>
" for tagbar --------------------------------------------------------------- end

"" for fzf --------------------------------------------------------------- begin
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>fg :Rg<CR>

" for configuring options for fzf - why this is not working ? 2023.11.10 TODO
let g:fzf_vim = {}

" preview window -- why this is not working ? 2023.11.10 TODO
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']

"" for fzf ----------------------------------------------------------------- end

" for coc ----------------------- begin
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" for coc ----------------------- end

" for vim-go -------------------- start
let g:go_fmt_options = { 'gofmt': '-s', 'goimports': '-local' }
let g:go_auto_type_info = 1
" for vim-go -------------------- end



filetype plugin indent on

se enc=utf-8

scripte utf-8

" use backspace
set bs=indent,eol,start

" show command completing
set sc

" show number line
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
set sm

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

" highlight cursor column
"set cc=51,81,121
"hilight ColorColumn ctermbg=17 guibg=navyblue
let &colorcolumn=join(range(81,999),",")
hi ColorColumn guibg=#000020 ctermbg=17

" color scheme
"colors desert


if exists("g:neovide")
    set mouse=a

    " Disable GUI Tabline
    if exists(':GuiTabline')
        GuiTabline 0
    endif

    " Disable GUI Popupmenu
    if exists(':GuiPopupmenu')
        GuiPopupmenu 0
    endif

    " Enable GUI ScrollBar
    if exists(':GuiScrollBar')
        GuiScrollBar 1
    endif

    " Right Click Context Menu (Copy-Cut-Paste)
    nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
    inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
    xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
    snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
endif

" terminal escape map
tnoremap <ESC> <C-\><C-n>

" change terminal emulator to pwsh
lua vim.opt.shell='pwsh'

" reload vim configuration - sv means "source vimrc"
nmap <leader>sv :source $MYVIMRC<CR>

" load environment-specific lua configurations --------------------------- begin

" load configuration from lua/env/init.lua
lua require('env')

" load environment-speicifc lua configuration ------------------------------ end
