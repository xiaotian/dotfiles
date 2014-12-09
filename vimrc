scriptencoding utf-8

set nocompatible
set number
set ruler
set hidden
set history=1000
set undolevels=1000
set mouse=a
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=/public/system/**
set visualbell "don't beep
set noerrorbells "don't beep

" following line has been moved to after/plugin/settings.vim so it won't be overriden by plugins like zipPLugin.vim
" set cpoptions+=$

set tags=./tags;

let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Enable_Fold_Column = 0

"noremap  <Up> ""
"noremap! <Up> <Esc>
"noremap  <Down> ""
"noremap! <Down> <Esc>
"noremap  <Left> ""
"noremap! <Left> <Esc>
"noremap  <Right> ""
"noremap! <Right> <Esc>

syntax on

call pathogen#infect()
filetype plugin indent on

set nowrap
set nobackup
set nowritebackup
set noswapfile

set tabstop=2
set shiftwidth=2
set softtabstop=2

set expandtab
set list listchars=tab:\ \ ,trail:.

" folding settings

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" emmet leader key
" if this isn't working, put
" stty start undef
" stty stop undef
" in bashrc file
let g:user_emmet_leader_key='<C-Q>'

" snipmate
let g:snippets_dir = "~/.dotfiles/vim/snippets"

" enable syntastic linting for python.
" with system python, do: 'pip install flake8'
let g:syntastic_python_checkers=['pyflakes', 'python']

" Status bar
set statusline=%<\ %n:%f\ %m%r%y\ [%{&ff}]%=%-35.(%l:%c\ %P(%L)\ \[0x%B]%)
set laststatus=2

" gives the $ symbol at the end of text substitute
set cpoptions+=$

" Leaderkey
let mapleader=","

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <leader>t :CtrlP<CR>
map <leader>b :CtrlPBuffer<cr>
map <leader>m :CtrlPMRU<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" toggle between terminal and vim mouse
map <leader>mm :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
"imap <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
function ShowMouseMode()
    if (&mouse == 'a')
        echo "mouse-vim"
    else
        echo "mouse-xterm"
    endif
endfunction

nmap <silent> <leader>b :MRU<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"system clipboard access:
map <Leader>y "*y
map <Leader>p "*p

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
" let NERDTreeDirArrows=0

" vim-rspec configuration
map <Leader>rf :RunSpec<CR>
map <Leader>rl :RunSpecLine<CR>
map <Leader>rd :RunSpecs<CR>

"Auto change the directory to the current file I am working on:
"use nerdtree's auto change instead.
"autocmd BufEnter * lcd %:p:h

" Command-T configuration
let g:CommandTMaxHeight=20


" CTags
map <Leader><Leader>t :TlistToggle<CR>
map <Leader><Leader>rt :!ctags --extra=+f -R *<CR><CR>

map <C-tab> :bn<CR>
map <C-S-tab> :bp<CR>
map! <C-tab> <C-O>:bn<CR>
map! <C-S-tab> <C-O>:bp<CR>


function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

function s:setColumnGuard()
  " 100 column guard
  if exists('+colorcolumn')
    set colorcolumn=100
  else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
  endif
endfunction

if has("autocmd")
  " Remember last location in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

  au FileType make                                     set noexpandtab

  " Thorfile, Rakefile and Gemfile are Ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby

  " md, markdown, and mk are markdown and define buffer-local preview
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

  au BufRead,BufNewFile *.txt call s:setupWrapping()
  au BufRead,BufNewFile *.hamlc   set ft=haml
  au BufRead,BufNewFile *.py set tabstop=4 expandtab shiftwidth=4 softtabstop=4
  autocmd FileType ruby,python,java,c,cpp,html,haml,javascript,coffee autocmd BufWritePre * :%s/\s\+$//e
  autocmd FileType python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType python call s:setColumnGuard()

endif
" make and python use real tabs

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Use modeline overrides
set modeline
set modelines=10
" Default color scheme
" color jellybeans
color colorsponge

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

filetype off
filetype indent plugin on

fun! Trim()
  try
    execute "%s/\\s\\+$//g"
    execute "%s/\\t/  /g"
  catch
  endtry
endfun

command Trim :call Trim()
command Q :qa
