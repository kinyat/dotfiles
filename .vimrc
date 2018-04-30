call plug#begin('~/.vim/plugged')

"Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git'
Plug 'tpope/vim-sleuth'
Plug '907th/vim-auto-save'
Plug 'isRuslan/vim-es6'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'flazz/vim-colorschemes'
Plug 'wincent/command-t'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'scrooloose/nerdcommenter'
Plug 'universal-ctags/ctags'
Plug 'Galooshi/vim-import-js'
Plug 'tpope/vim-surround'
Plug 'gioele/vim-autoswap'
Plug 'majutsushi/tagbar'
Plug 'dkprice/vim-easygrep'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'Chiel92/vim-autoformat'
Plug 'jparise/vim-graphql'
Plug 'osyo-manga/vim-over'
Plug 'terryma/vim-multiple-cursors'
Plug 'leafgarland/typescript-vim'
Plug 'wikitopian/hardmode'
"Plug 'Quramy/tsuquyomi'
"Plug 'Quramy/vim-dtsm'

call plug#end()

let mapleader = "\<Space>"

" indent
autocmd FileType Jenkinsfile setlocal expandtab shiftwidth=2 tabstop=2

" command-t
function! CommandTAcceptSelectionTab()
  ruby $command_t.accept_selection :command => 'tab drop'
endfunction

" autoformat
nnoremap <F3> :Autoformat<CR>

" ts tsuquyomi
"autocmd FileType typescript setlocal completeopt-=menu

" ale
let g:ale_fixers = {
\   'javascript': ['standard'],
\   'typescript': ['standard'],
\}
let g:ale_linters = {
\  'javascript': ['standard'],
\  'typescript': ['standard'],
\}
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = "never"
let g:ale_javascript_prettier_standard_options = '--env jest'
let g:ale_javascript_standard_options = '--env jest'
let g:ale_typescript_prettier_standard_options = '--env jest'
let g:ale_typescript_standard_options = '--env jest'
nnoremap <Leader>f :ALEFix<CR>

" Fix cursor disappear
autocmd BufWinLeave * :silent !tput cvvis

" Whiltespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWritePre * :%s/\s\+$//e

" NerdTree
nnoremap <Leader>m :NERDTreeToggle<CR>
nnoremap <Leader>n :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

" Move Split
nnoremap <C-e> :Exp<CR>
nnoremap <C-h> <C-w><Left>
nnoremap <C-j> <C-w><Down>
nnoremap <C-k> <C-w><Up>
nnoremap <C-l> <C-w><Right>
nnoremap <Space> <nop>
nnoremap <Leader>o :on<CR>
nnoremap <Leader>v :vsp<CR>
nnoremap <Leader>q <C-w>q
nnoremap <Leader>s :split<CR>
nnoremap <Leader>= <C-w>5+
nnoremap <Leader>- <C-w>5-
nnoremap <Leader>, <C-w>10<
nnoremap <Leader>. <C-w>10>
nnoremap ∆ <C-d>
nnoremap ˚ <C-u>

" Drag and resize
set mouse+=a
set ttymouse=xterm2

" Disable Arrow keys in Escape mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

nnoremap <Leader>h :set hlsearch!<CR>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Vim Config
set clipboard=unnamed,unnamedplus
set incsearch
set nocompatible
set wildmenu
" set wildmode=longest:list,full
set number
set relativenumber
set backspace=indent,eol,start
set splitright
set splitbelow
" setlocal spell
colorscheme transparent

"set autoread
"function! SyntasticCheckHook(errors)
"  checktime
"endfunction

" auto save
"let g:auto_save = 1
"let g:auto_save_in_insert_mode = 0

"augroup syntastic
    "autocmd CursorHold * nested update
"augroup END
"set updatetime=200

" Syntastic syntax config
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_javascript_standard_args = '--env jest --verbose'
"let g:syntastic_javascript_checkers = ['standard']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1

if &diff
  let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

" Command-t
let g:CommandTWildIgnore=&wildignore . ",*/bower_components,*/node_modules,*/vendor"

" YouCompleteMe
let g:ycm_path_to_python_interpreter="/usr/bin/python"
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_invoke_completion = '<C-Space>'
"let g:ycm_filetype_blacklist = {
  "\'typescript': 1
"\}

" ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Persistent Undo
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
  let myUndoDir = expand(vimDir . '/undodir')
  " Create dirs
  call system('mkdir ' . vimDir)
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  set undofile
endif

" Yml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" auto pairs
let g:AutoPairsFlyMode = 1

" over
"nnoremap : :OverCommandLine<CR>

" Hard Mode
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" NERDTree
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber"
