source ~/.nvim.plug

let mapleader=" "

set backspace=indent,eol,start

color 0x7A69_dark

set number
set relativenumber

set cursorline
set expandtab
set modelines=0
set clipboard=unnamed
set encoding=utf-8
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

set wildmenu
set wildmode=longest:full,full

" Quick ESC
" imap kj <ESC>

" Buffer switching
" ================
map <Leader>a :bprev<Return>
map <Leader>s :bnext<Return>

nmap <C-l> :bnext<cr>
nmap <C-h> :bprevious<cr>

" yank stack
" ==========
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" sneek
" =====
nmap f <Plug>Sneak_s
xmap f <Plug>Sneak_s
omap f <Plug>Sneak_s

" airline
" =======
set noshowmode
set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_b="%f"
let g:airline_section_c=""
let g:airline_section_x=""
let g:airline_section_y=""
let g:airline_section_z="%{gutentags#statusline()}"

" FZF
" ======
nmap <C-p> :FZF<cr>

" glutentags
" ==========
let g:gutentags_cache_dir=expand('~/.tag-cache')

" delete whitespace
" =================
let blacklist = ['md']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :DeleteTrailingWhitespace
