source ~/.nvim.plug

let mapleader=" "

set backspace=indent,eol,start

set number
set relativenumber

" set cursorline
set expandtab
set modelines=0
set clipboard=unnamed
set tabstop=2
set nowrap
set nowritebackup
set noswapfile
set nobackup
set hidden      " Allow buffer switching even if unsaved
set mouse=a     " Enable mouse usage (all modes)
set ignorecase " case-insensitive searching
set smartcase  " but become case-sensitive if you type uppercase characters
set hlsearch   " highlight search matches
set expandtab
set shiftwidth=2
set softtabstop=2
set ttyfast
set lazyredraw

set synmaxcol=256 " disable syntax highlighting after 128 chars

set wildmenu
set wildmode=longest:full,full

hi StatusLine ctermfg=black
set statusline=
set statusline+=\ \ %f
"set statusline+=\ »\ %{fugitive#statusline()}
set statusline+=%=
set statusline+=\ %c
set statusline+=\ %h%m%r%w

let mapleader = "\<Space>"

" Buffer switching
" ================
nmap <C-l> :bnext<cr>
nmap <C-h> :bprevious<cr>

" yank stack
" ==========
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" FZF
" ======
nmap <C-p> :FZF<cr>

" Gutentags
" ==========
let g:gutentags_cache_dir=expand('~/.tag-cache')

" delete whitespace
" =================
let blacklist = ['md']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :DeleteTrailingWhitespace
