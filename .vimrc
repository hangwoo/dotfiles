filetype plugin indent on    " required
syntax enable
let mapleader=","

set ruler
set backspace=indent,eol,start " backspace 로 지울 수 있도록
set cindent " c indent 사용
set autoindent
set copyindent
"set showmatch
set smarttab
set incsearch
set nowrapscan
set hlsearch
set history=1000
set undolevels=1000
set wrap
set encoding=utf-8
set showcmd
set hidden " Controversial
set wildmenu
set wildmode=list:longest
"set visualbell
set number
"set relativenumber
set undofile
set ignorecase
set smartcase
set gdefault
set colorcolumn=80
set textwidth=79
set formatoptions=cqnr1
set cursorline
set nojoinspaces
set splitright

set splitbelow

set wildignore+=*.so,*.swp,*.zip,*.pyc
set wildignore+=*.o,*.out,*.obj,*.so,*.pyc
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/.sass-cache/*
set wildignore+=*.swp,*~,._*

"set nobackup
set noundofile

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noshowmode

noremap <F1> <ESC>
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap / /\v
vnoremap / /\v
nmap <tab> %
vmap <tab> %
nnoremap <leader><space> :nohlsearch<CR>

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'bling/vim-bufferline'

call plug#end()

" colorscheme catppuccin
colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

" CoC extensions  run :CocInstall coc-tsserver
let g:coc_global_extensions = ['coc-tsserver']

" Nerdtree
" map <C-e> <plug>NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <F3> :NERDTreeFind<CR>
nmap <F4> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:nerdtree_tabs_open_on_gui_startup=0

" Tagbar
nnoremap <silent> <leader>t<space> :TagbarToggle<CR>
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

" Ctrlp
"let g:ctrlp_custom_ignore = {
"\ 'dir':  '\v[\/]\.(git|hg|svn)$',
"\ 'file': '\v\.(exe|so|dll)$',
"\ 'link': 'some_bad_symbolic_links',
"\ }

let g:ctrlp_working_path_mode = 0
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.so$\|\.pyc$' }

nnoremap <leader>b :CtrlPBuffer<CR>

set visualbell
set t_vb=

" cscope
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction
au BufEnter /* call LoadCscope()

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" minibufexpl
" let g:miniBufExplBuffersNeeded = 1

noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

noremap <C-Down>  <C-W>j
noremap <C-Up>    <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right> <C-W>l

command WQ wq
command Wq wq
command W w
command Q q
command WA wa
command Wa wa

nnoremap <silent> <leader>a<space> :A<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LOCAL SETTING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_level = 3

" tags
set tags=./tags,tags

" ctrlp exclude
let g:ctrlp_mruf_case_sensitive = 0
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/node_modules/*,*/lib/*,*/plugins/*,*platforms/*,*/revisions/*,*/locales/*


" Ailline !!
" Use patched fonts
let g:airline_powerline_fonts = 1

"ale-linter
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-tsserver']

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1


nnoremap <Alt-Left> <C-O>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

set paste
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype cpp setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown setlocal ts=2 sts=2 sw=2

