source ~/.nvim.plug

let mapleader=" "

set backspace=indent,eol,start

set number
set relativenumber

set cursorline
set modelines=0
set clipboard=unnamed
set nowrap
set nowritebackup
set noswapfile
set nobackup
set hidden      " Allow buffer switching even if unsaved
set mouse=a     " Enable mouse usage (all modes)
set ignorecase " case-insensitive searching
set smartcase  " but become case-sensitive if you type uppercase characters
set hlsearch   " highlight search matches
set ttyfast
set lazyredraw
set splitbelow
set splitright

set tabstop=2
set shiftwidth=2
set expandtab

" ruby syntax highlighting is super slow
set synmaxcol=80 " disable syntax highlighting after x chars
set regexpengine=1

set wildmenu
set wildmode=longest:full,full

hi clear SpellBad " incorrectly spelled word style
hi SpellBad cterm=underline,bold ctermfg=172

":hi CursorLine ctermbg=darkred
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Spell check enabled for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

highlight StatusLine NONE ctermbg=Black ctermfg=LightGreen
set statusline=
set statusline+=\ \ %f
"set statusline+=\ »\ %{fugitive#statusline()}
set statusline+=%=
set statusline+=\ %c
set statusline+=\ %h%m%r%w

let mapleader = "\<Space>"

" Disable SQL auto completion
" ===========================
let g:omni_sql_no_default_maps = 1

" Buffer switching
" ================
nmap <C-n> :bnext<cr>
nmap <C-m> :bprevious<cr>

" yank stack
" ==========
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" FZF
" ======
nmap <C-p> :FZF<cr>
nmap <C-b> :Buffers<cr>

" Gutentags
" ==========
let g:gutentags_cache_dir=expand('~/.tag-cache')

" delete whitespace
" =================
let blacklist = ['md']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :DeleteTrailingWhitespace

" Terminal
" ========
:tnoremap <C-h> <C-\><C-n><C-w>h
:tnoremap <C-j> <C-\><C-n><C-w>j
:tnoremap <C-k> <C-\><C-n><C-w>k
:tnoremap <C-l> <C-\><C-n><C-w>l
:au BufEnter * if &buftype == 'terminal' | :startinsert | endif
:autocmd TermOpen * setlocal statusline=%{b:term_title}
" Movement doens't apply in fzf
:au FileType fzf :tnoremap <buffer> <C-J> <C-W><C-J>
:au FileType fzf :tnoremap <buffer> <C-k> <C-W><C-k>

" JSX
:let g:jsx_ext_required = 0
