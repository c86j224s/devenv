local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'

-- a tree explorer for vim
Plug 'scrooloose/nerdtree'

-- cscope
Plug 'brookhong/cscope.vim'

-- a git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

-- (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

-- coc
Plug('neoclide/coc.nvim', {branch = 'release'})

vim.call('plug#end')

