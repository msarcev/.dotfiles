" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
"Plug 'github/copilot.vim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'mortepau/codicons.nvim'

Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

" NERDtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
" Plug 'nerdtree-visual-selection'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Java
" Plug 'mfussenegger/nvim-jdtls'

" Kotlin
" Plug 'udalov/kotlin-vim'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'

" Go
Plug 'darrikonn/vim-gofmt'

" Js
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" Coloscheme
Plug 'gruvbox-community/gruvbox'
Plug 'luisiacc/gruvbox-baby'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" prettier
Plug 'sbdchd/neoformat'
Plug 'windwp/nvim-ts-autotag'
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

" Comment
Plug 'numToStr/Comment.nvim'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting

call plug#end()

lua require("marshar")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }, autotag = { enable = true } }

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-kotlin']  " list of CoC extensions needed

lua require('Comment').setup()

let mapleader = " "

imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

nnoremap <silent> Q <nop>

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap Y yg$

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

inoremap <C-q> <esc>
lua << EOF

local saga = require'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}
EOF

